import 'package:drift/drift.dart';

@DataClassName('VaultModel')
class Vault extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get amountOnHand => real().withDefault(const Constant(0.00))();
}

@DataClassName('AddedToVaultModel')
class AddedToVault extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
  IntColumn get vaultId => integer()
      .customConstraint('NOT NULL REFERENCES vault(id) ON DELETE CASCADE')();
  RealColumn get amount => real()();
  TextColumn get description => text().withLength(min: 1, max: 50)();
  TextColumn get note => text().withLength(max: 50).nullable()();
}

@DataClassName('ReducedFromVaultModel')
class ReducedFromVault extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
  IntColumn get vaultId => integer()
      .customConstraint('NOT NULL REFERENCES vault(id) ON DELETE CASCADE')();
  RealColumn get amount => real()();
  TextColumn get description => text().withLength(min: 1, max: 50)();
  TextColumn get note => text().withLength(max: 50).nullable()();
}
