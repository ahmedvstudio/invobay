import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/return_related_model/return_receipt_details_model.dart';
import '../db_providers/database_provider.dart';

final returnReceiptDetailProvider =
    FutureProvider.family<ReturnReceiptDetail, int>(
  (ref, receiptId) async {
    final db = ref.watch(databaseProvider);

    final receipt = await (db.select(db.returnReceipts)
          ..where((r) => r.id.equals(receiptId)))
        .getSingle();
    final items = await (db.select(db.returnReceiptItems)
          ..where((i) => i.receiptId.equals(receiptId)))
        .get();
    final payment = await (db.select(db.returnPayments)
          ..where((p) => p.receiptId.equals(receiptId)))
        .getSingle();

    return ReturnReceiptDetail(
        receipt: receipt, items: items, payment: payment);
  },
);
