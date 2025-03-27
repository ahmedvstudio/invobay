import 'package:drift/drift.dart';

class Receipts extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
  RealColumn get totalPrice => real()();
  TextColumn get customerName => text().nullable()();
  TextColumn get paymentMethod => text().nullable()();
}

class ReceiptItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get receiptId => integer()
      .customConstraint('NOT NULL REFERENCES receipts(id) ON DELETE CASCADE')();
  IntColumn get itemId => integer()
      .customConstraint('NOT NULL REFERENCES items(id) ON DELETE CASCADE')();
  RealColumn get quantity => real()();
  RealColumn get price => real()();
}
