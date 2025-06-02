import 'package:invobay/core/models/vault_model/vault_transaction_model.dart';

import '../../database/drift/app_database.dart';

class VaultDetail {
  final VaultModel vault;
  final double totalAdded;
  final double totalReduced;
  final double currentBalance;
  final List<VaultTransactionModel> transactions;

  VaultDetail({
    required this.vault,
    required this.totalAdded,
    required this.totalReduced,
    required this.currentBalance,
    required this.transactions,
  });
}
