import '../../database/drift/app_database.dart';

class ReturnItem {
  final Item item;
  final double quantity;

  ReturnItem({
    required this.item,
    required this.quantity,
  });

  ReturnItem copyWith({Item? item, double? quantity, String? itemUnit}) {
    return ReturnItem(
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
    );
  }
}
