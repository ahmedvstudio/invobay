import '../../database/drift/app_database.dart';

class BuyItem {
  final Item item;
  final double quantity;
  final double price;

  BuyItem({
    required this.item,
    required this.quantity,
    required this.price,
  });

  BuyItem copyWith(
      {Item? item, double? quantity, double? price, String? itemUnit}) {
    return BuyItem(
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}
