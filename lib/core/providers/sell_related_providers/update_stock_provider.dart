import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../database/app_database.dart';
import '../../repository/item_dao.dart';

final itemDaoProvider = Provider<ItemDao>((ref) {
  final database = AppDatabase.getInstance(); // Use your singleton instance
  return ItemDao(database);
});

final updateStockProvider = Provider((ref) {
  final itemDao = ref.watch(itemDaoProvider);
  return (int itemId, double quantitySold) async {
    await itemDao.reduceStockQuantity(itemId, quantitySold);
  };
});
