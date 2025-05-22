import 'package:drift/drift.dart';

import '../../../utils/constants/enums.dart';

@DataClassName('BuyReceiptsModel')
class BuyReceipts extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
  IntColumn get supplierId => integer()
      .customConstraint('REFERENCES suppliers(id) ON DELETE SET NULL')
      .nullable()();
  RealColumn get subTotalPrice => real()();
  RealColumn get discount => real().withDefault(const Constant(0.00))();
  TextColumn get discountType =>
      text().withDefault(Constant(DiscountType.percentage.name))();
  RealColumn get shippingFee => real().withDefault(const Constant(0.00))();
  RealColumn get taxFee => real().withDefault(const Constant(0.00))();
  RealColumn get totalPrice => real()();
}

@DataClassName('BuyReceiptItemsModel')
class BuyReceiptItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get receiptId => integer().customConstraint(
      'NOT NULL REFERENCES buyReceipts(id) ON DELETE CASCADE')();
  IntColumn get itemId => integer()
      .customConstraint('NOT NULL REFERENCES items(id) ON DELETE CASCADE')();
  RealColumn get quantity => real()();
  RealColumn get price => real()();
}

@DataClassName('BuyPaymentsModel')
class BuyPayments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get receiptId => integer()
      .customConstraint('REFERENCES buyReceipts(id) ON DELETE CASCADE')();
  TextColumn get paymentMethod => text()();
  RealColumn get paidAmount => real()();
  RealColumn get debtAmount => real()();
  DateTimeColumn get paymentDate =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get status => text().withDefault(const Constant('Completed'))();
}
