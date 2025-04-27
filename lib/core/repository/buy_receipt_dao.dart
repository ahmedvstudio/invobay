import 'package:drift/drift.dart' as drift;
import 'package:invobay/core/database/drift/app_database.dart';

import '../models/buy_related_model/buy_model.dart';
import '../models/buy_related_model/buy_with_payment_model.dart';

class BuyReceiptDao {
  final AppDatabase db;

  BuyReceiptDao(this.db);

  Future<int> saveBuyReceipt({
    required List<BuyItem> boughtItems,
    required double subTotalPrice,
    required double totalPrice,
    required double discount,
    required double shippingFee,
    required double taxFee,
    required String paymentMethod,
    required String paymentStatus,
    required double amountPaid,
    required double amountDebt,
    int? supplierId,
  }) async {
    return await db.transaction(() async {
      // Insert into BuyReceipts
      final receiptId = await db.into(db.buyReceipts).insert(
            BuyReceiptsCompanion(
              supplierId: drift.Value(supplierId),
              subTotalPrice: drift.Value(subTotalPrice),
              discount: drift.Value(discount),
              shippingFee: drift.Value(shippingFee),
              taxFee: drift.Value(taxFee),
              totalPrice: drift.Value(totalPrice),
            ),
          );

      // Insert BuyReceiptItems
      for (var item in boughtItems) {
        await db.into(db.buyReceiptItems).insert(
              BuyReceiptItemsCompanion(
                receiptId: drift.Value(receiptId),
                itemId: drift.Value(item.item.id),
                quantity: drift.Value(item.quantity),
                price: drift.Value(item.price),
              ),
            );
      }

      // Insert Payment Details
      await db.into(db.buyPayments).insert(
            BuyPaymentsCompanion(
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

  Stream<List<BuyReceiptsWithPaymentModel>> watchReceiptsWithPayments() {
    return (db.select(db.buyReceipts).join([
      drift.innerJoin(db.buyPayments,
          db.buyPayments.receiptId.equalsExp(db.buyReceipts.id)),
    ])
          ..orderBy([
            drift.OrderingTerm.desc(db.buyReceipts.date),
          ]))
        .watch()
        .map((rows) {
      return rows.map((row) {
        final receipt = row.readTable(db.buyReceipts);
        final payment = row.readTable(db.buyPayments);
        return BuyReceiptsWithPaymentModel(
          id: receipt.id,
          date: receipt.date,
          paymentMethod: payment.paymentMethod,
          totalPrice: receipt.totalPrice,
          paidAmount: payment.paidAmount,
          debtAmount: payment.debtAmount,
          paymentStatus: payment.status,
        );
      }).toList();
    });
  }

  Future<void> deleteReceipt(int id) async {
    // Fetch sold items associated with the receipt
    final soldItems = await (db.select(db.buyReceiptItems)
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
    await (db.delete(db.buyReceipts)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> updatePaymentDetails({
    required int receiptId,
    required double newPaidAmount,
    required double newDebtAmount,
    required String newPaymentStatus,
  }) async {
    await db.transaction(() async {
      // Update Payment Details
      await (db.update(db.buyPayments)
            ..where((tbl) => tbl.receiptId.equals(receiptId)))
          .write(
        BuyPaymentsCompanion(
          paidAmount: drift.Value(newPaidAmount),
          debtAmount: drift.Value(newDebtAmount),
          status: drift.Value(newPaymentStatus),
        ),
      );
    });
  }
}
