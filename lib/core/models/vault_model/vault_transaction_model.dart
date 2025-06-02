class VaultTransactionModel {
  final int id;
  final int vaultId;
  final DateTime date;
  final double amount;
  final String description;
  final String? note;
  final bool isOut;

  VaultTransactionModel({
    required this.id,
    required this.vaultId,
    required this.date,
    required this.amount,
    required this.description,
    required this.note,
    required this.isOut,
  });
}
