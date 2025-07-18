import '../../database/drift/app_database.dart';

class SellItem {
  final Item item;
  final double quantity;

  SellItem({
    required this.item,
    required this.quantity,
  });

  SellItem copyWith({Item? item, double? quantity, String? itemUnit}) {
    return SellItem(
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
    );
  }
}
