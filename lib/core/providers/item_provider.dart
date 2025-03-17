import 'package:flutter/foundation.dart';
import 'package:invobay/core/database/app_database.dart';
import 'package:invobay/core/repository/item_dao.dart';
import 'package:drift/drift.dart';

class ItemProvider extends ChangeNotifier {
  final ItemDao itemDao;

  List<Item> _items = [];

  List<Item> get items => _items;

  ItemProvider(this.itemDao);

  Future<void> fetchItems() async {
    _items = await itemDao.getAllItems();
    notifyListeners();
  }

  Future<void> addItem(ItemsCompanion item) async {
    await itemDao.insertItem(item);
    await fetchItems();
  }

  Future<void> updateItem(ItemsCompanion item) async {
    await itemDao.updateItem(item);
    await fetchItems();
  }

  Future<void> deleteItem(int id) async {
    await itemDao.deleteItem(id);
    await fetchItems();
  }

  Future<void> addQuantity(int itemId, int quantity) async {
    final item = _items.firstWhere((item) => item.id == itemId);
    final newQuantity = item.quantity + quantity;

    await itemDao.updateItem(
      ItemsCompanion(
        id: Value(itemId),
        name: Value(item.name),
        quantity: Value(newQuantity),
        sellingPrice: Value(item.sellingPrice),
        buyingPrice: Value(item.buyingPrice),
        supplierName: Value(item.supplierName),
        description: Value(item.description),
        barcode: Value(item.barcode),
      ),
    );

    await fetchItems();
  }

  Future<Item?> getItemByName(String name) async {
    Item? foundItem;

    try {
      foundItem = _items.firstWhere(
        (item) => item.name == name,
      );
    } catch (e) {
      // No matching item found
      foundItem = null;
    }

    return foundItem; // Return the found item or null
  } // Method to fetch items that start with the given prefix

  Future<List<Item>> getItemsByNameStartsWith(String prefix) async {
    // Implement your database query here to find items by name prefix
    return _items
        .where(
            (item) => item.name.toLowerCase().startsWith(prefix.toLowerCase()))
        .toList();
  }
}
