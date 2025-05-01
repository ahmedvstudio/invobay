import 'package:drift/drift.dart' as drift;
import 'package:invobay/core/database/drift/app_database.dart';

import '../models/return_related_model/return_model.dart';
import '../models/return_related_model/return_with_payment_model.dart';

class ReturnReceiptDao {
  final AppDatabase db;

  ReturnReceiptDao(this.db);

  Future<int> saveReturnReceipt({
    required List<ReturnItem> returnedItems,
    required double subTotalPrice,
    required double totalPrice,
    required double discount,
    required double shippingFee,
    required double taxFee,
    required String paymentMethod,
    required String paymentStatus,
    required double amountPaid,
    required double amountDebt,
  }) async {
    return await db.transaction(() async {
      // Insert into ReturnReceipts
      final receiptId = await db.into(db.returnReceipts).insert(
            ReturnReceiptsCompanion(
              subTotalPrice: drift.Value(subTotalPrice),
              discount: drift.Value(discount),
              shippingFee: drift.Value(shippingFee),
              taxFee: drift.Value(taxFee),
              totalPrice: drift.Value(totalPrice),
            ),
          );

      // Insert ReturnReceiptItems
      for (var item in returnedItems) {
        await db.into(db.returnReceiptItems).insert(
              ReturnReceiptItemsCompanion(
                receiptId: drift.Value(receiptId),
                itemId: drift.Value(item.item.id),
                quantity: drift.Value(item.quantity),
                price: drift.Value(item.item.sellingPrice),
              ),
            );
      }

      // Insert Payment Details
      await db.into(db.returnPayments).insert(
            ReturnPaymentsCompanion(
              receiptId: drift.Value(receiptId),
              paymentMethod: drift.Value(paymentMethod),
              paidAmount: drift.Value(amountPaid),
              debtAmount: drift.Value(amountDebt),
              status: drift.Value(paymentStatus),
            ),
          );

      return receiptId;
    });
  }

  Stream<List<ReturnReceiptsWithPaymentModel>> watchReceiptsWithPayments() {
    return (db.select(db.returnReceipts).join([
      drift.innerJoin(db.returnPayments,
          db.returnPayments.receiptId.equalsExp(db.returnReceipts.id)),
    ])
          ..orderBy([
            drift.OrderingTerm.desc(db.returnReceipts.date),
          ]))
        .watch()
        .map((rows) {
      return rows.map((row) {
        final receipt = row.readTable(db.returnReceipts);
        final payment = row.readTable(db.returnPayments);
        return ReturnReceiptsWithPaymentModel(
          id: receipt.id,
          date: receipt.date,
          paymentMethod: payment.paymentMethod,
          totalPrice: receipt.totalPrice,
          paidAmount: payment.paidAmount,
          debtAmount: payment.debtAmount,
          paymentStatus: payment.status,
          // Add other fields as necessary
        );
      }).toList();
    });
  }

  Future<void> deleteReceiptsByIds(List<int> ids) async {
    await db.transaction(() async {
      final receiptItems = await (db.select(db.returnReceiptItems)
            ..where((tbl) => tbl.receiptId.isIn(ids)))
          .get();

      // Group items by itemId to update stock in batch
      final Map<int, double> quantityToRestore = {};
      for (final item in receiptItems) {
        quantityToRestore.update(item.itemId, (qty) => qty - item.quantity,
            ifAbsent: () => item.quantity);
      }

      // Update stock for each affected item
      for (final entry in quantityToRestore.entries) {
        final current = await (db.select(db.items)
              ..where((tbl) => tbl.id.equals(entry.key)))
            .getSingleOrNull();

        if (current != null) {
          final newQty = current.quantity - entry.value;
          await (db.update(db.items)..where((tbl) => tbl.id.equals(entry.key)))
              .write(ItemsCompanion(quantity: drift.Value(newQty)));
        }
      }

      // Delete in batch
      await (db.delete(db.returnReceiptItems)
            ..where((tbl) => tbl.receiptId.isIn(ids)))
          .go();
      await (db.delete(db.returnPayments)
            ..where((tbl) => tbl.receiptId.isIn(ids)))
          .go();
      await (db.delete(db.returnReceipts)..where((tbl) => tbl.id.isIn(ids)))
          .go();
    });
  }

  Future<void> deleteReceipt(int id) async {
    // Fetch sold items associated with the receipt
    final returnedItems = await (db.select(db.returnReceiptItems)
          ..where((tbl) => tbl.receiptId.equals(id)))
        .get();

    // Return quantities to stock
    for (final item in returnedItems) {
      // Fetch the current stock quantity for the item
      final currentItemList = await (db.select(db.items)
            ..where((tbl) => tbl.id.equals(item.itemId)))
          .get();

      if (currentItemList.isNotEmpty) {
        final currentItem = currentItemList.first;
        final newQuantity = currentItem.quantity - item.quantity;

        // Update the item quantity in stock
        await (db.update(db.items)..where((tbl) => tbl.id.equals(item.itemId)))
            .write(
          ItemsCompanion(
            quantity: drift.Value(newQuantity),
          ),
        );
      }
    }

    // Now delete the receipt
    await (db.delete(db.returnReceipts)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<void> updatePaymentDetails({
    required int receiptId,
    required double newPaidAmount,
    required double newDebtAmount,
    required String newPaymentStatus,
  }) async {
    await db.transaction(() async {
      // Update Payment Details
      await (db.update(db.returnPayments)
            ..where((tbl) => tbl.receiptId.equals(receiptId)))
          .write(
        ReturnPaymentsCompanion(
          paidAmount: drift.Value(newPaidAmount),
          debtAmount: drift.Value(newDebtAmount),
          status: drift.Value(newPaymentStatus),
        ),
      );
    });
  }
}
