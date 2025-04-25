import 'package:drift/drift.dart' as drift;
import 'package:invobay/core/database/drift/app_database.dart';

import '../models/sell_related_model/sell_model.dart';
import '../models/sell_related_model/sell_with_payment_model.dart';

class SellReceiptDao {
  final AppDatabase db;

  SellReceiptDao(this.db);

  Future<int> saveSellReceipt({
    required List<SellItem> soldItems,
    required double subTotalPrice,
    required double totalPrice,
    required double discount,
    required double shippingFee,
    required double taxFee,
    required String paymentMethod,
    required String paymentStatus,
    required double amountPaid,
    required double amountDebt,
    int? customerId,
  }) async {
    return await db.transaction(() async {
      // Insert into SellReceipts
      final receiptId = await db.into(db.sellReceipts).insert(
            SellReceiptsCompanion(
              customerId: drift.Value(customerId),
              // paymentMethod: drift.Value(paymentMethod),
              subTotalPrice: drift.Value(subTotalPrice),
              discount: drift.Value(discount),
              shippingFee: drift.Value(shippingFee),
              taxFee: drift.Value(taxFee),
              totalPrice: drift.Value(totalPrice),
            ),
          );

      // Insert SellReceiptItems
      for (var item in soldItems) {
        await db.into(db.sellReceiptItems).insert(
              SellReceiptItemsCompanion(
                receiptId: drift.Value(receiptId),
                itemId: drift.Value(item.item.id),
                quantity: drift.Value(item.quantity),
                price: drift.Value(item.item.sellingPrice),
              ),
            );
      }

      // Insert Payment Details
      await db.into(db.sellPayments).insert(
            SellPaymentsCompanion(
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

  Stream<List<SellReceiptsWithPaymentModel>> watchReceiptsWithPayments() {
    return (db.select(db.sellReceipts).join([
      drift.innerJoin(db.sellPayments,
          db.sellPayments.receiptId.equalsExp(db.sellReceipts.id)),
    ])
          ..orderBy([
            drift.OrderingTerm.desc(db.sellReceipts.date),
          ]))
        .watch()
        .map((rows) {
      return rows.map((row) {
        final receipt = row.readTable(db.sellReceipts);
        final payment = row.readTable(db.sellPayments);
        return SellReceiptsWithPaymentModel(
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

  Future<void> deleteReceipt(int id) async {
    // Fetch sold items associated with the receipt
    final soldItems = await (db.select(db.sellReceiptItems)
          ..where((tbl) => tbl.receiptId.equals(id)))
        .get();

    // Return quantities to stock
    for (final item in soldItems) {
      // Fetch the current stock quantity for the item
      final currentItemList = await (db.select(db.items)
            ..where((tbl) => tbl.id.equals(item.itemId)))
          .get();

      if (currentItemList.isNotEmpty) {
        final currentItem = currentItemList.first;
        final newQuantity = currentItem.quantity + item.quantity;

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
    await (db.delete(db.sellReceipts)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> updatePaymentDetails({
    required int receiptId,
    required double newPaidAmount,
    required double newDebtAmount,
    required String newPaymentStatus,
  }) async {
    await db.transaction(() async {
      // Update Payment Details
      await (db.update(db.sellPayments)
            ..where((tbl) => tbl.receiptId.equals(receiptId)))
          .write(
        SellPaymentsCompanion(
          paidAmount: drift.Value(newPaidAmount),
          debtAmount: drift.Value(newDebtAmount),
          status: drift.Value(newPaymentStatus),
        ),
      );
    });
  }
}
