class ItemModel {
  final int? id;
  final String name;
  final int quantity;
  final double sellingPrice;
  final double buyingPrice;
  final String supplierName;
  final String description;
  final String? barcode;

  ItemModel({
    this.id,
    required this.name,
    required this.quantity,
    required this.sellingPrice,
    required this.buyingPrice,
    required this.supplierName,
    required this.description,
    this.barcode,
  });
}
