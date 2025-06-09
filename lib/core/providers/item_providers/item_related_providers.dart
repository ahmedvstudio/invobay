import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/drift/app_database.dart';
import '../../repository/item_dao.dart';
import '../db_providers/hive_providers/app_settings_provider.dart';
import 'item_notifier.dart';
import '../db_providers/database_provider.dart';

// ItemDao provider
final itemDaoProvider = Provider<ItemDao>((ref) {
  final database = ref.watch(databaseProvider);
  return ItemDao(database);
});

// Item Notifier provider
final itemNotifierProvider =
    StateNotifierProvider.autoDispose<ItemNotifier, List<Item>>((ref) {
  final itemDao = ref.watch(itemDaoProvider);
  final threshold = ref.watch(lowStockThresholdProvider);
  return ItemNotifier(itemDao, threshold);
});

// Item By ID Provider
final itemByIdProvider = StreamProvider.family<Item?, int>((ref, id) {
  final itemDao = ref.watch(itemDaoProvider);
  return itemDao.watchItemById(id);
});
