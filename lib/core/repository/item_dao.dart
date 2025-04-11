import 'package:drift/drift.dart' as drift;
import '../database/app_database.dart';

class ItemDao {
  final AppDatabase db;

  ItemDao(this.db);

  // Insert a new item into the database
  Future<int> insertItem(ItemsCompanion item) => db.into(db.items).insert(item);

  // Get all items from the database
  Future<List<Item>> getAllItems() => db.select(db.items).get();

  // Get a single item by its ID
  Future<Item?> getItemById(int? id) async {
    // Fetch the item by its ID. Returns null if not found.
    return await (db.select(db.items)..where((tbl) => tbl.id.equals(id!)))
        .getSingleOrNull();
  }

  // Update an existing item
  Future<void> updateItem(ItemsCompanion item) =>
      db.update(db.items).replace(item);

  // Delete an item by its ID
  Future<void> deleteItem(int id) =>
      (db.delete(db.items)..where((tbl) => tbl.id.equals(id))).go();

  // Search for items by name or barcode
  Future<List<Item>> searchItems(String query) {
    final queryStatement = db.select(db.items)
      ..where(
        (item) => item.name.like('%$query%') | item.barcode.like('%$query%'),
      );

    return queryStatement.get(); // This returns a Future<List<Item>>
  }

  // Check if an item exists by its name or barcode
  Future<Map<String, bool>> checkItemExistence(
      String name, String? barcode) async {
    bool nameExists = false;
    bool barcodeExists = false;

    // Check if an item with the same name exists
    final nameQuery = await (db.select(db.items)
          ..where((tbl) => tbl.name.equals(name)))
        .get();
    if (nameQuery.isNotEmpty) nameExists = true;

    // Check if an item with the same barcode exists
    if (barcode != null && barcode.isNotEmpty) {
      final barcodeQuery = await (db.select(db.items)
            ..where((tbl) => tbl.barcode.equals(barcode)))
          .get();
      if (barcodeQuery.isNotEmpty) barcodeExists = true;
    }

    // Return a map with the existence of the item by name and barcode
    return {'name': nameExists, 'barcode': barcodeExists};
  }

  Future<void> reduceStockQuantity(int itemId, double quantitySold) async {
    // Fetch current stock quantity
    final item = await getItemById(itemId);

    if (item != null && item.quantity >= quantitySold) {
      // Update stock quantity
      await (db.update(db.items)..where((tbl) => tbl.id.equals(itemId))).write(
        ItemsCompanion(
          quantity: drift.Value(item.quantity - quantitySold),
        ),
      );
    }
  }

  Future<void> increaseStockQuantity(
      int itemId, double quantityReturned) async {
    // Fetch current stock quantity
    final item = await getItemById(itemId);

    if (item != null && item.quantity >= quantityReturned) {
      // Update stock quantity
      await (db.update(db.items)..where((tbl) => tbl.id.equals(itemId))).write(
        ItemsCompanion(
          quantity: drift.Value(item.quantity + quantityReturned),
        ),
      );
    }
  }

  Future<Item?> getItemByBarcode(String barcode) async {
    final result = await (db.select(db.items)
          ..where((tbl) => tbl.barcode.equals(barcode)))
        .get();
    return result.isNotEmpty
        ? result.first
        : null; // Return the first item or null
  }
}
