import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:invobay/core/database/tables/customers_table.dart';
import 'package:invobay/core/database/tables/sell_receipts_tables.dart';
import 'package:invobay/core/database/tables/suppliers_table.dart';
import 'package:invobay/core/utils/helpers/logger.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'tables/items_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
    tables: [Items, SellReceipts, SellReceiptItems, Customers, Suppliers])
class AppDatabase extends _$AppDatabase {
  // Private constructor
  AppDatabase._() : super(_openConnection());

  // Singleton instance
  static final AppDatabase instance = AppDatabase._();

  static AppDatabase getInstance() => instance;

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.sqlite'));
    Vlogger.info('Data Initialized');
    return NativeDatabase(file);
  });
}
