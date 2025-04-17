import 'package:drift/drift.dart';

class Items extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get quantity => real()();
  RealColumn get sellingPrice => real()();
  RealColumn get buyingPrice => real()();
  TextColumn get supplierName => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get barcode => text().nullable()();
  TextColumn get itemUnit => text().nullable()();
}
