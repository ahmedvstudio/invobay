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
}
