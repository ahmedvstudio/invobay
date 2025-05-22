class CustomerSpendModel {
  final int id;
  final String name;
  final double totalSpent;

  CustomerSpendModel({
    required this.id,
    required this.name,
    required this.totalSpent,
  });
}

class CustomerDebtModel {
  final int id;
  final String name;
  final double totalDebt;

  CustomerDebtModel({
    required this.id,
    required this.name,
    required this.totalDebt,
  });
}

// class MostSoldItemModel {
//   final int id;
//   final String name;
//   final double totalSold;
//
//   MostSoldItemModel({
//     required this.id,
//     required this.name,
//     required this.totalSold,
//   });
// }
class MostSoldItemModel {
  final int id;
  final String name;
  final int totalQuantity;
  final double totalRevenue;

  MostSoldItemModel({
    required this.id,
    required this.name,
    required this.totalQuantity,
    required this.totalRevenue,
  });
}
