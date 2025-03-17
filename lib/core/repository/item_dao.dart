import 'package:drift/drift.dart';

import '../database/app_database.dart';

class ItemDao {
  final AppDatabase db;

  ItemDao(this.db);

  Future<int> insertItem(ItemsCompanion item) => db.into(db.items).insert(item);

  Future<List<Item>> getAllItems() => db.select(db.items).get();

  Future<void> updateItem(ItemsCompanion item) =>
      db.update(db.items).replace(item);

  Future<void> deleteItem(int id) =>
      (db.delete(db.items)..where((tbl) => tbl.id.equals(id))).go();

  SimpleSelectStatement<$ItemsTable, Item> searchItems(String query) {
    return db.select(db.items)
      ..where(
          (item) => item.name.like('%$query%') | item.barcode.like('%$query%'));
  }

  Future<Item?> getItemById(int id) {
    return (db.select(db.items)..where((item) => item.id.equals(id)))
        .getSingleOrNull();
  }
}
