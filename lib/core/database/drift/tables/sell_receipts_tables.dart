import 'package:drift/drift.dart';

@DataClassName('SellReceiptsModel')
class SellReceipts extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
  IntColumn get customerId => integer()
      .customConstraint('REFERENCES customers(id) ON DELETE SET NULL')
      .nullable()();
  RealColumn get subTotalPrice => real()();
  RealColumn get discount => real().withDefault(const Constant(0.00))();
  RealColumn get shippingFee => real().withDefault(const Constant(0.00))();
  RealColumn get taxFee => real().withDefault(const Constant(0.00))();
  RealColumn get totalPrice => real()();
}

@DataClassName('SellReceiptItemsModel')
class SellReceiptItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get receiptId => integer().customConstraint(
      'NOT NULL REFERENCES sellReceipts(id) ON DELETE CASCADE')();
  IntColumn get itemId => integer()
      .customConstraint('NOT NULL REFERENCES items(id) ON DELETE CASCADE')();
  RealColumn get quantity => real()();
  RealColumn get price => real()();
  RealColumn get costPrice => real()();
}

@DataClassName('SellPaymentsModel')
class SellPayments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get receiptId => integer()
      .customConstraint('REFERENCES sellReceipts(id) ON DELETE CASCADE')();
  TextColumn get paymentMethod => text()();
  RealColumn get paidAmount => real()();
  RealColumn get debtAmount => real()();
  DateTimeColumn get paymentDate =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get status => text().withDefault(const Constant('Completed'))();
}
