import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:invobay/core/database/tables/sell_receipts_tables.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../models/sell_model.dart';
import 'tables/items_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Items, Receipts, ReceiptItems])
class AppDatabase extends _$AppDatabase {
  // Private constructor
  AppDatabase._() : super(_openConnection());

  // Singleton instance
  static final AppDatabase instance = AppDatabase._();

  static AppDatabase getInstance() => instance;

  @override
  int get schemaVersion => 2;

  Future<int> insertReceipt(double totalPrice, String? customerName) {
    return into(receipts).insert(
      ReceiptsCompanion(
        totalPrice: Value(totalPrice),
        customerName: Value(customerName),
      ),
    );
  }

  Future<void> insertReceiptItems(int receiptId, List<SellItem> items) async {
    for (var item in items) {
      await into(receiptItems).insert(
        ReceiptItemsCompanion(
          receiptId: Value(receiptId),
          itemId: Value(item.item.id),
          quantity: Value(item.quantity),
          price: Value(item.item.sellingPrice),
        ),
      );
    }
  }

  Future<List<Receipt>> getReceipts() {
    return select(receipts).get();
  }

  Future<List<ReceiptItem>> getReceiptItems(int receiptId) {
    return (select(receiptItems)
          ..where((tbl) => tbl.receiptId.equals(receiptId)))
        .get();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.sqlite'));
    return NativeDatabase(file);
  });
}
