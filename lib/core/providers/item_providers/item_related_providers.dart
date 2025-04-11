import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/app_database.dart';
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
final itemByIdProvider = FutureProvider.family<Item, int>((ref, itemId) async {
  final db = ref.watch(databaseProvider);
  return await (db.select(db.items)..where((i) => i.id.equals(itemId)))
      .getSingle();
});
