import 'package:flutter/foundation.dart';
import 'package:invobay/core/database/app_database.dart';
import 'package:invobay/core/repository/item_dao.dart';

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
}
