import 'package:drift/drift.dart';

@DataClassName('CustomerData')
class Customers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn? get phoneNumber =>
      text().withLength(min: 1, max: 15).nullable()();
  TextColumn? get street => text().withLength(min: 1, max: 100).nullable()();
  TextColumn? get postalCode => text().withLength(min: 1, max: 10).nullable()();
  TextColumn? get city => text().withLength(min: 1, max: 50).nullable()();
  TextColumn? get state => text().withLength(min: 1, max: 50).nullable()();
  TextColumn? get country => text().withLength(min: 1, max: 50).nullable()();
}
