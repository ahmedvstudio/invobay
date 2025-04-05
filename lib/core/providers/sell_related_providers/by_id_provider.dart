import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/database/app_database.dart';

import '../db_notifiers/app_providers.dart';

// Item By ID Provider
final itemByIdProvider = FutureProvider.family<Item, int>((ref, itemId) async {
  final db = ref.watch(databaseProvider);
  return await (db.select(db.items)..where((i) => i.id.equals(itemId)))
      .getSingle();
});

// Customer By ID Provide
final customerByIdProvider =
    FutureProvider.family<CustomerData?, int>((ref, customerId) {
  final customerDao = ref.watch(customerDaoProvider);
  return customerDao.getCustomerById(customerId);
});
