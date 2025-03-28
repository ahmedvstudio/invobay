class ItemModel {
  final int? id;
  final String name;
  final double quantity;
  final double sellingPrice;
  final double buyingPrice;
  final String? supplierName;
  final String? description;
  final String? barcode;

  ItemModel({
    this.id,
    required this.name,
    required this.quantity,
    required this.sellingPrice,
    required this.buyingPrice,
    this.supplierName,
    this.description,
    this.barcode,
  });

  // Factory constructor for creating an instance from a map
  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'],
      name: map['name'],
      quantity: map['quantity'],
      sellingPrice: map['sellingPrice'],
      buyingPrice: map['buyingPrice'],
      supplierName: map['supplierName'],
      description: map['description'],
      barcode: map['barcode'],
    );
  }

  // Method to convert instance to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'sellingPrice': sellingPrice,
      'buyingPrice': buyingPrice,
      'supplierName': supplierName,
      'description': description,
      'barcode': barcode,
    };
  }
}
