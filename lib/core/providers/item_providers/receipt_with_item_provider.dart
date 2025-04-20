import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/database/drift/app_database.dart';

import '../db_providers/database_provider.dart';

final receiptsWithItemProvider =
    FutureProvider.family<List<BuyReceiptsModel>, int>((ref, itemId) async {
  final db = ref.watch(databaseProvider);

  // Join buyReceiptItems and buyReceipts filtering by itemId
  final rows = await (db.select(db.buyReceiptItems).join([
    innerJoin(db.buyReceipts,
        db.buyReceipts.id.equalsExp(db.buyReceiptItems.receiptId)),
  ])
        ..where(db.buyReceiptItems.itemId.equals(itemId)))
      .get();

  // Extract unique receipts from join result
  final receipts =
      rows.map((row) => row.readTable(db.buyReceipts)).toSet().toList();

  return receipts;
});
