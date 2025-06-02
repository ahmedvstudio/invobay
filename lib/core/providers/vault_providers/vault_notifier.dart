import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/vault_model/vault_detail_model.dart';
import '../../repository/vault_dao.dart';

class VaultDetailNotifier extends StateNotifier<AsyncValue<VaultDetail?>> {
  final VaultDao _dao;
  int? _currentVaultId;
  final dateNow = DateTime.now();
  VaultDetailNotifier(this._dao) : super(const AsyncValue.loading());

  Future<void> loadVault(int vaultId) async {
    _currentVaultId = vaultId;
    state = const AsyncValue.loading();
    try {
      final data = await _dao.getVaultDetail(vaultId);

      state = AsyncValue.data(data);
    } catch (err, stackTrace) {
      state = AsyncValue.error(err, stackTrace);
    }
  }

  Future<void> updateAmountOnHand(int vaultId, double newAmount) async {
    try {
      await _dao.updateAmountOnHand(vaultId, newAmount);
      await loadVault(vaultId);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addToVault(
      {required int vaultId,
      required double amount,
      required String description,
      String? note,
      DateTime? date}) async {
    await _dao.addToVault(vaultId, amount, description, date ?? dateNow,
        note: note);
    await loadVault(vaultId);
  }

  Future<void> reduceFromVault(
      {required int vaultId,
      required double amount,
      required String description,
      String? note,
      DateTime? date}) async {
    await _dao.reduceFromVault(vaultId, amount, description, date ?? dateNow,
        note: note);
    await loadVault(vaultId);
  }

  Future<void> updateAddedTransaction({
    required int id,
    required double amount,
    required String description,
    String? note,
    DateTime? date,
  }) async {
    await _dao.updateAddedTransaction(
      id: id,
      amount: amount,
      description: description,
      note: note,
      date: date ?? dateNow,
    );
    if (_currentVaultId != null) {
      await loadVault(_currentVaultId!);
    }
  }

  Future<void> updateReducedTransaction({
    required int id,
    required double amount,
    required String description,
    String? note,
    DateTime? date,
  }) async {
    await _dao.updateReducedTransaction(
      id: id,
      amount: amount,
      description: description,
      note: note,
      date: date ?? dateNow,
    );
    if (_currentVaultId != null) {
      await loadVault(_currentVaultId!);
    }
  }

  Future<void> deleteAddedTransaction(int id) async {
    await _dao.deleteAddedTransaction(id);
    if (_currentVaultId != null) {
      await loadVault(_currentVaultId!);
    }
  }

  Future<void> deleteReducedTransaction(int id) async {
    await _dao.deleteReducedTransaction(id);
    if (_currentVaultId != null) {
      await loadVault(_currentVaultId!);
    }
  }
}
