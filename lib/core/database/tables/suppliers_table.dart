import 'package:drift/drift.dart';

@DataClassName('SupplierData')
class Suppliers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get phoneNumber => text().withLength(min: 1, max: 15)();
  TextColumn get street => text().withLength(min: 1, max: 100)();
  TextColumn get postalCode => text().withLength(min: 1, max: 10)();
  TextColumn get city => text().withLength(min: 1, max: 50)();
  TextColumn get state => text().withLength(min: 1, max: 50)();
  TextColumn get country => text().withLength(min: 1, max: 50)();
}
