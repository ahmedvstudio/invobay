import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/sell_related_model/sell_receipt_details_model.dart';
import '../db_providers/database_provider.dart';

final sellReceiptDetailProvider = FutureProvider.family<SellReceiptDetail, int>(
  (ref, receiptId) async {
    final db = ref.watch(databaseProvider);

    final receipt = await (db.select(db.sellReceipts)
          ..where((r) => r.id.equals(receiptId)))
        .getSingle();
    final items = await (db.select(db.sellReceiptItems)
          ..where((i) => i.receiptId.equals(receiptId)))
        .get();
    final payment = await (db.select(db.sellPayments)
          ..where((p) => p.receiptId.equals(receiptId)))
        .getSingle();

    return SellReceiptDetail(receipt: receipt, items: items, payment: payment);
  },
);
