import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/database/app_database.dart';
import 'package:invobay/core/repository/item_dao.dart';

import 'item_notifier_provider.dart';

// Database instance provider
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase.getInstance();
});

// ItemDao provider
final itemDaoProvider = Provider<ItemDao>((ref) {
  final database = ref.watch(databaseProvider);
  return ItemDao(database);
});

// ItemNotifier provider
final itemNotifierProvider =
    StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  final itemDao = ref.watch(itemDaoProvider);
  return ItemNotifier(itemDao);
});
