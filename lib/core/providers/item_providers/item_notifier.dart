import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/database/app_database.dart';
import 'package:invobay/core/repository/item_dao.dart';
import 'package:drift/drift.dart';

class ItemNotifier extends StateNotifier<List<Item>> {
  final ItemDao itemDao;

  ItemNotifier(this.itemDao) : super([]) {
    fetchItems(); // Fetch items on initialization
  }

  // Fetch all items from the database
  Future<void> fetchItems() async {
    final items = await itemDao.getAllItems();
    state = [...items]; // Create a new list to trigger state updates
  }

  // Check for duplicate name or barcode
  Future<String?> _checkItemExistence(String name, String? barcode) async {
    final existenceCheck = await itemDao.checkItemExistence(name, barcode);
    if (existenceCheck['name'] ?? false) {
      return "Item with the same name already exists.";
    }
    if (existenceCheck['barcode'] ?? false) {
      return "Item with the same barcode already exists.";
    }
    return null; // No error
  }

  // Add a new item, checking for duplicate name or barcode
  Future<String?> addItem(ItemsCompanion item) async {
    final error =
        await _checkItemExistence(item.name.value, item.barcode.value);
    if (error != null) return error;

    await itemDao.insertItem(item);
    await fetchItems(); // Fetch updated items
    return null; // No error
  }

  // Update an existing item
  Future<void> updateItem(ItemsCompanion item) async {
    await itemDao.updateItem(item);
    await fetchItems();
  }

  // Delete an item by its ID
  Future<void> deleteItem(int id) async {
    await itemDao.deleteItem(id);
    await fetchItems();
  }

  // Validate quantity input
  Future<String?> _validateQuantity(
      double quantity, double availableStock) async {
    if ((quantity * 100) % 1 != 0) {
      return "Quantity cannot have more than 2 decimal places.";
    }
    if (availableStock + quantity < 0) {
      return "Not enough stock available.";
    }
    return null; // No error
  }

  // Add quantity to an existing item and check if available stock is enough
  Future<String?> addQuantity(int? itemId, double quantity) async {
    final fetchedItem = await itemDao.getItemById(itemId!);
    if (fetchedItem == null) {
      return "Item not found in the inventory.";
    }

    final validationError =
        await _validateQuantity(quantity, fetchedItem.quantity);
    if (validationError != null) {
      return validationError;
    }

    final newQuantity = fetchedItem.quantity + quantity;
    await itemDao.updateItem(
      ItemsCompanion(
        id: Value(itemId),
        name: Value(fetchedItem.name),
        quantity: Value(newQuantity),
        sellingPrice: Value(fetchedItem.sellingPrice),
        buyingPrice: Value(fetchedItem.buyingPrice),
        supplierName: Value(fetchedItem.supplierName),
        description: Value(fetchedItem.description),
        barcode: Value(fetchedItem.barcode),
      ),
    );

    await fetchItems();
    return null; // No error
  }

  // Add this method in your ItemNotifier class
  Future<Item?> fetchItemByBarcode(String barcode) async {
    // Fetch item by barcode using the ItemDao
    final item = await itemDao.getItemByBarcode(barcode);
    return item; // This should return an Item or null if not found
  }
}
