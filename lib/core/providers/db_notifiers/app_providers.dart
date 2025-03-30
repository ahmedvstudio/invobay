import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/database/app_database.dart';
import 'package:invobay/core/providers/db_notifiers/sell_notifier.dart';
import 'package:invobay/core/providers/db_notifiers/supplier_notifier.dart';
import 'package:invobay/core/repository/item_dao.dart';

import '../../models/sell_model.dart';
import '../../repository/customer_dao.dart';
import '../../repository/supplier_dao.dart';
import 'customer_notifier.dart';
import 'item_notifier.dart';

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

// Sell Notifier Provider
final sellNotifierProvider =
    StateNotifierProvider<SellNotifier, List<SellItem>>((ref) {
  final itemDao = ref.read(itemDaoProvider);
  return SellNotifier(ref, itemDao);
});

// Customer Notifier Provider
final customerNotifierProvider =
    StateNotifierProvider<CustomerNotifier, List<CustomerData>>((ref) {
  final database = AppDatabase.getInstance(); // Use your singleton instance
  return CustomerNotifier(CustomerDao(database))
    ..loadCustomers(); // Load initial customers
});

// Supplier Notifier Provider
final supplierNotifierProvider =
    StateNotifierProvider<SupplierNotifier, List<SupplierData>>((ref) {
  final database = AppDatabase.getInstance(); // Use your singleton instance
  return SupplierNotifier(SupplierDao(database))..loadSuppliers();
});
