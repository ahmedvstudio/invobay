import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/database/drift/app_database.dart';

import '../db_providers/database_provider.dart';

final receiptsWithItemProvider =
    StreamProvider.family<List<BuyReceiptsModel>, int>((ref, itemId) {
  final db = ref.watch(databaseProvider);

  final query = (db.select(db.buyReceiptItems).join([
    innerJoin(db.buyReceipts,
        db.buyReceipts.id.equalsExp(db.buyReceiptItems.receiptId)),
  ])
    ..where(db.buyReceiptItems.itemId.equals(itemId)));

  // Map the stream of joined rows to a stream of unique buyReceipts
  return query.watch().map((rows) {
    final receipts =
        rows.map((row) => row.readTable(db.buyReceipts)).toSet().toList();
    return receipts;
  });
});
