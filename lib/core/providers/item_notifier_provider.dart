import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/database/app_database.dart';
import 'package:invobay/core/repository/item_dao.dart';
import 'package:drift/drift.dart';
import 'app_providers.dart';

// Riverpod provider for ItemNotifier
final itemNotifierProvider =
    StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  final itemDao = ref.watch(itemDaoProvider);
  return ItemNotifier(itemDao);
});

class ItemNotifier extends StateNotifier<List<Item>> {
  final ItemDao itemDao;

  ItemNotifier(this.itemDao) : super([]) {
    fetchItems(); // Fetch items on initialization
  }

  Future<void> fetchItems() async {
    state = await itemDao.getAllItems();
  }

  Future<void> addItem(ItemsCompanion item) async {
    await itemDao.insertItem(item);
    fetchItems(); // Refresh state
  }

  Future<void> updateItem(ItemsCompanion item) async {
    await itemDao.updateItem(item);
    fetchItems();
  }

  Future<void> deleteItem(int id) async {
    await itemDao.deleteItem(id);
    fetchItems();
  }

  Future<void> addQuantity(int itemId, int quantity) async {
    final item = state.firstWhere((item) => item.id == itemId);
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

    fetchItems();
  }
}
