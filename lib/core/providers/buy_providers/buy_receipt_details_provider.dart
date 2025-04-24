import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/buy_related_model/buy_receipt_with_item_details_model.dart';
import '../db_providers/database_provider.dart';

final receiptsDetailsProvider =
    StreamProvider.family<List<BuyReceiptWithItemDetails>, int>((ref, itemId) {
  final db = ref.watch(databaseProvider);

  final query = (db.select(db.buyReceiptItems).join([
    innerJoin(db.buyReceipts,
        db.buyReceipts.id.equalsExp(db.buyReceiptItems.receiptId)),
  ])
    ..where(db.buyReceiptItems.itemId.equals(itemId)));

  return query.watch().map((rows) {
    return rows.map((row) {
      final receipt = row.readTable(db.buyReceipts);
      final receiptItem = row.readTable(db.buyReceiptItems);
      return BuyReceiptWithItemDetails(
        receipt: receipt,
        itemPrice: receiptItem.price,
        quantity: receiptItem.quantity,
        receiptId: receipt.id,
        receiptDate: receipt.date,
        supplierId: receipt.supplierId,
      );
    }).toList();
  });
});
