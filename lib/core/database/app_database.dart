import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

part 'app_database.g.dart';

class Items extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get quantity => integer()();
  RealColumn get sellingPrice => real()();
  RealColumn get buyingPrice => real()();
  TextColumn get supplierName => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get barcode => text().nullable()();
}

@DriftDatabase(tables: [Items])
class AppDatabase extends _$AppDatabase {
  // Private constructor
  AppDatabase._() : super(_openConnection());

  // Singleton instance
  static final AppDatabase instance = AppDatabase._();

  @override
  int get schemaVersion => 1;

  // Static method to access the database
  static AppDatabase getInstance() {
    return instance;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.sqlite'));
    return NativeDatabase(file);
  });
}
