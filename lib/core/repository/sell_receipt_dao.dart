import 'package:drift/drift.dart' as drift;
import 'package:invobay/core/database/app_database.dart';

import '../models/sell_model.dart';

class SellReceiptDao {
  final AppDatabase db;

  SellReceiptDao(this.db);

  Future<int> saveSellReceipt({
    required List<SellItem> soldItems,
    required double totalPrice,
    required double discount,
    required double shippingFee,
    required double taxFee,
    required String paymentMethod,
    int? customerId,
  }) async {
    return await db.transaction(() async {
      // Insert into SellReceipts
      final receiptId = await db.into(db.sellReceipts).insert(
            SellReceiptsCompanion(
              customerId: drift.Value(customerId),
              paymentMethod: drift.Value(paymentMethod),
              subTotalPrice: drift.Value(totalPrice),
              discount: drift.Value(discount),
              shippingFee: drift.Value(shippingFee),
              taxFee: drift.Value(taxFee),
              totalPrice: drift.Value(totalPrice + shippingFee + taxFee),
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
              amount: drift.Value(totalPrice + shippingFee + taxFee),
            ),
          );

      return receiptId;
    });
  }

  Future<void> deleteReceipt(int id) async {
    await (db.delete(db.sellReceipts)..where((tbl) => tbl.id.equals(id))).go();
  }
}
