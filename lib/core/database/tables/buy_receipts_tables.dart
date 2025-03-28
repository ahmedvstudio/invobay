import 'package:drift/drift.dart';

class BuyReceipts extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
  TextColumn get paymentMethod => text()();
  IntColumn get buyReceiptItemsId => integer()
      .customConstraint('NOT NULL REFERENCES buyItems(id) ON DELETE CASCADE')();
  IntColumn get supplierId => integer().customConstraint(
      'NOT NULL REFERENCES suppliers(id) ON DELETE CASCADE')();
  RealColumn get subTotalPrice => real()();
  RealColumn get discount => real().withDefault(const Constant(0))();
  RealColumn get shippingFee => real().withDefault(const Constant(0.00))();
  RealColumn get taxFee => real().withDefault(const Constant(0.00))();
  RealColumn get totalPrice => real()();
}

class BuyItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get itemName => text()
      .customConstraint('NOT NULL REFERENCES name(id) ON DELETE CASCADE')();
  RealColumn get quantity => real()();
  RealColumn get unitPrice => real().customConstraint('NOT NULL')();
}

class Suppliers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get supplierName => text().withLength(min: 1, max: 255)();
  TextColumn get supplierAddress => text().nullable()();
  TextColumn get supplierNumber => text().nullable()();
  TextColumn get supplierNotes => text().nullable()();
}
