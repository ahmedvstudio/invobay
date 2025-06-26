import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:invobay/core/database/drift/app_database.dart';
import 'package:invobay/core/providers/localization_related_providers/localization_provider.dart';
import 'package:invobay/core/repository/item_dao.dart';
import 'package:drift/drift.dart';

import '../../services/notification/notification_service.dart';
import '../../services/notification/notification_types/stock_notifications.dart';
import '../../utils/constants/hive_box_strings.dart';
import '../db_providers/hive_providers/app_settings_provider.dart';
import '../notification_providers/notification_related_provider.dart';

class ItemNotifier extends StateNotifier<List<Item>> {
  final ItemDao itemDao;
  final Ref ref;
  ItemNotifier(this.itemDao, this.ref) : super([]) {
    fetchItems();
  }

  // Fetch all items from the database
  Future<void> fetchItems() async {
    final items = await itemDao.getAllItems();
    state = [...items]; // Create a new list to trigger state updates

    // After updating state, check for stock notifications
    await checkStockAndNotify(ref);
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

  // Add this inside your ItemNotifier class
  Future<void> updateBuyingPrice(int itemId, double newBuyingPrice) async {
    // Fetch the current item
    final item = await itemDao.getItemById(itemId);
    if (item == null) return; // Optionally, handle error

    // Update only the buying price
    await itemDao.updateItem(
      ItemsCompanion(
        id: Value(itemId),
        name: Value(item.name),
        quantity: Value(item.quantity),
        sellingPrice: Value(item.sellingPrice),
        buyingPrice: Value(newBuyingPrice),
        description: Value(item.description),
        barcode: Value(item.barcode),
        itemUnit: Value(item.itemUnit),
      ),
    );
    await fetchItems();
  }

  Future<void> updateSellingPrice(int itemId, double newSellingPrice) async {
    final item = await itemDao.getItemById(itemId);
    if (item == null) return;

    await itemDao.updateItem(
      ItemsCompanion(
        id: Value(itemId),
        name: Value(item.name),
        quantity: Value(item.quantity),
        sellingPrice: Value(newSellingPrice),
        buyingPrice: Value(item.buyingPrice),
        description: Value(item.description),
        barcode: Value(item.barcode),
        itemUnit: Value(item.itemUnit),
      ),
    );

    await fetchItems();
  }

  /// ----------- Notify Stock -----------------///

  Future<void> checkStockAndNotify(Ref ref) async {
    final flagsBox = Hive.box(VHive.stockNotificationFlagBox);
    final threshold = ref.watch(lowStockThresholdProvider);
    final toggles = ref.read(notificationToggleProvider);
    final loc = ref.watch(localizationProvider);
    for (final item in state) {
      final lowStockFlagKey = 'low_${item.id}';
      final outOfStockFlagKey = 'out_${item.id}';

      if (item.quantity == 0) {
        if (toggles['out_of_stock'] == true &&
            !(flagsBox.get(outOfStockFlagKey, defaultValue: false) as bool)) {
          await showOutOfStockNotification(item.name, item.id, loc);
          flagsBox.put(outOfStockFlagKey, true);
        }
        flagsBox.put(lowStockFlagKey, false);
      } else if (item.quantity <= threshold) {
        if (toggles['low_stock'] == true &&
            !(flagsBox.get(lowStockFlagKey, defaultValue: false) as bool)) {
          await showLowStockNotification(
              item.name, item.quantity.toInt(), item.id, loc);
          flagsBox.put(lowStockFlagKey, true);
        }
        flagsBox.put(outOfStockFlagKey, false);
      } else {
        flagsBox.put(lowStockFlagKey, false);
        flagsBox.put(outOfStockFlagKey, false);
      }
    }
  }
}
