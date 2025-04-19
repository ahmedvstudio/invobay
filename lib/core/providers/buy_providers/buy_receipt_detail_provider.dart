import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/buy_related_model/buy_receipt_details_model.dart';
import '../db_providers/database_provider.dart';

final buyReceiptDetailProvider = FutureProvider.family<BuyReceiptDetail, int>(
  (ref, receiptId) async {
    final db = ref.watch(databaseProvider);

    final receipt = await (db.select(db.buyReceipts)
          ..where((r) => r.id.equals(receiptId)))
        .getSingle();
    final items = await (db.select(db.buyReceiptItems)
          ..where((i) => i.receiptId.equals(receiptId)))
        .get();
    final payment = await (db.select(db.buyPayments)
          ..where((p) => p.receiptId.equals(receiptId)))
        .getSingle();

    return BuyReceiptDetail(receipt: receipt, items: items, payment: payment);
  },
);
