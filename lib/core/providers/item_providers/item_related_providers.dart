import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/drift/app_database.dart';
import '../../repository/item_dao.dart';
import 'item_notifier.dart';
import '../db_providers/database_provider.dart';

// ItemDao provider
final itemDaoProvider = Provider<ItemDao>((ref) {
  final database = ref.watch(databaseProvider);
  return ItemDao(database);
});

// Item Notifier provider
final itemNotifierProvider =
    StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  final itemDao = ref.watch(itemDaoProvider);
  return ItemNotifier(itemDao);
});

// Item By ID Provider
final itemByIdProvider = StreamProvider.family<Item?, int>((ref, id) {
  final itemDao = ref.watch(itemDaoProvider);
  return itemDao.watchItemById(id);
});
