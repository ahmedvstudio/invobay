import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/app_database.dart';
import '../../models/item_model.dart';
import '../../repository/customers_dao.dart';
import '../../repository/item_dao.dart';
import '../../repository/sell_receipt_dao.dart';
import '../../repository/sell_items_dao.dart';
import 'item_notifier.dart';

// App Database Provider
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  // Create a new instance of your AppDatabase here
  return AppDatabase();
});

// Item DAO Provider
final itemDaoProvider = Provider<ItemDao>((ref) {
  final database = ref.watch(appDatabaseProvider);
  return ItemDao(database);
});

// Sell Receipts DAO Provider
final sellReceiptsDaoProvider = Provider<SellReceiptsDao>((ref) {
  final database = ref.watch(appDatabaseProvider);
  return SellReceiptsDao(database);
});

// Sell Receipt Items DAO Provider
final sellItemsDaoProvider = Provider<SellItemsDao>((ref) {
  final database = ref.watch(appDatabaseProvider);
  return SellItemsDao(database);
});

// Customers DAO Provider
final customersDaoProvider = Provider<CustomersDao>((ref) {
  final database = ref.watch(appDatabaseProvider);
  return CustomersDao(database);
});

// Item Notifier Provider
final itemNotifierProvider =
    StateNotifierProvider<ItemNotifier, List<ItemModel>>((ref) {
  final itemDao = ref.watch(itemDaoProvider);
  return ItemNotifier(itemDao);
});
