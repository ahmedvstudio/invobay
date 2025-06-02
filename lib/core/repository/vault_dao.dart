import 'package:drift/drift.dart';

import '../database/drift/app_database.dart';
import '../models/vault_model/vault_detail_model.dart';
import '../models/vault_model/vault_transaction_model.dart';

class VaultDao {
  final AppDatabase db;
  VaultDao(this.db);
  Future<int> createDefaultVault() {
    return db.into(db.vault).insert(
          VaultCompanion.insert(
            id: const Value(1),
            amountOnHand: const Value(0.0),
          ),
        );
  }

  Future<VaultDetail?> getVaultDetail(int vaultId) async {
    final vault = await (db.select(db.vault)
          ..where((t) => t.id.equals(vaultId)))
        .getSingleOrNull();
    if (vault == null) {
      final newVaultId = await createDefaultVault();
      return await getVaultDetail(newVaultId);
    }
    final totalAdded = await (db.select(db.addedToVault)
          ..where((t) => t.vaultId.equals(vaultId)))
        .map((row) => row.amount)
        .get()
        .then((list) => list.fold<double>(0, (a, b) => a + b));

    final totalReduced = await (db.select(db.reducedFromVault)
          ..where((t) => t.vaultId.equals(vaultId)))
        .map((row) => row.amount)
        .get()
        .then((list) => list.fold<double>(0, (a, b) => a + b));

    final currentBalance = vault.amountOnHand + totalAdded - totalReduced;
    final transactions = await getVaultTransactions(vaultId);

    return VaultDetail(
      vault: vault,
      totalAdded: totalAdded,
      totalReduced: totalReduced,
      currentBalance: currentBalance,
      transactions: transactions,
    );
  }

  Future<int> updateAmountOnHand(int vaultId, double newAmount) {
    return (db.update(db.vault)..where((tbl) => tbl.id.equals(vaultId))).write(
      VaultCompanion(
        amountOnHand: Value(newAmount),
      ),
    );
  }

  Future<int> addToVault(
      int vaultId, double amount, String description, DateTime date,
      {String? note}) {
    return db.into(db.addedToVault).insert(
          AddedToVaultCompanion(
            vaultId: Value(vaultId),
            amount: Value(amount),
            description: Value(description),
            note: Value(note),
            date: Value(date),
          ),
        );
  }

  Future<int> reduceFromVault(
      int vaultId, double amount, String description, DateTime date,
      {String? note}) {
    return db.into(db.reducedFromVault).insert(
          ReducedFromVaultCompanion(
            vaultId: Value(vaultId),
            amount: Value(amount),
            description: Value(description),
            note: Value(note),
            date: Value(date),
          ),
        );
  }

  Future<List<VaultTransactionModel>> getVaultTransactions(int vaultId) async {
    final added = await (db.select(db.addedToVault)
          ..where((tbl) => tbl.vaultId.equals(vaultId)))
        .get();

    final reduced = await (db.select(db.reducedFromVault)
          ..where((tbl) => tbl.vaultId.equals(vaultId)))
        .get();

    final allTransactions = [
      ...added.map((txn) => VaultTransactionModel(
            id: txn.id,
            vaultId: txn.vaultId,
            date: txn.date,
            amount: txn.amount,
            description: txn.description,
            note: txn.note,
            isOut: false,
          )),
      ...reduced.map((txn) => VaultTransactionModel(
            id: txn.id,
            vaultId: txn.vaultId,
            date: txn.date,
            amount: txn.amount,
            description: txn.description,
            note: txn.note,
            isOut: true,
          )),
    ];

    allTransactions.sort((a, b) => b.date.compareTo(a.date));

    return allTransactions;
  }

  Future<int> updateAddedTransaction({
    required int id,
    required double amount,
    required String description,
    String? note,
    required DateTime date,
  }) {
    return (db.update(db.addedToVault)..where((t) => t.id.equals(id))).write(
      AddedToVaultCompanion(
        amount: Value(amount),
        description: Value(description),
        note: Value(note),
        date: Value(date),
      ),
    );
  }

  Future<int> updateReducedTransaction({
    required int id,
    required double amount,
    required String description,
    String? note,
    required DateTime date,
  }) {
    return (db.update(db.reducedFromVault)..where((t) => t.id.equals(id)))
        .write(
      ReducedFromVaultCompanion(
        amount: Value(amount),
        description: Value(description),
        note: Value(note),
        date: Value(date),
      ),
    );
  }

  Future<int> deleteAddedTransaction(int id) {
    return (db.delete(db.addedToVault)..where((t) => t.id.equals(id))).go();
  }

  Future<int> deleteReducedTransaction(int id) {
    return (db.delete(db.reducedFromVault)..where((t) => t.id.equals(id))).go();
  }
}
