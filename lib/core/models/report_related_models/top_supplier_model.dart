class SupplierSpendModel {
  final int id;
  final String name;
  final double totalSpent;
  SupplierSpendModel(
      {required this.id, required this.name, required this.totalSpent});
}

class SupplierDebtModel {
  final int id;
  final String name;
  final double totalDebt;
  SupplierDebtModel(
      {required this.id, required this.name, required this.totalDebt});
}

class MostBoughtItemModel {
  final int id;
  final String name;
  final double totalQuantity;
  final double totalSpent;

  MostBoughtItemModel({
    required this.id,
    required this.name,
    required this.totalQuantity,
    required this.totalSpent,
  });
}

class ItemAverageCostModel {
  final int id;
  final String name;
  final double averageCost;
  ItemAverageCostModel(
      {required this.id, required this.name, required this.averageCost});
}
