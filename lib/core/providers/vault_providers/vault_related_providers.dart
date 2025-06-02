import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/providers/vault_providers/vault_notifier.dart';

import '../../models/vault_model/vault_detail_model.dart';
import '../../repository/vault_dao.dart';
import '../db_providers/database_provider.dart';

final vaultDetailDaoProvider = Provider<VaultDao>((ref) {
  final db = ref.watch(databaseProvider);
  return VaultDao(db);
});

//
final vaultDetailNotifierProvider = StateNotifierProvider.family<
    VaultDetailNotifier, AsyncValue<VaultDetail?>, int>((ref, vaultId) {
  final dao = ref.watch(vaultDetailDaoProvider);
  final notifier = VaultDetailNotifier(dao);
  notifier.loadVault(vaultId);
  return notifier;
});
