import '../../database/drift/app_database.dart';

class BuyItem {
  final Item item;
  final double quantity;

  BuyItem({
    required this.item,
    required this.quantity,
  });

  BuyItem copyWith({Item? item, double? quantity, String? itemUnit}) {
    return BuyItem(
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
    );
  }
}
