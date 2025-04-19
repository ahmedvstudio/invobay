import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/database/drift/app_database.dart';
import 'package:invobay/core/providers/supplier_providers/supplier_notifier.dart';

import '../../repository/supplier_dao.dart';
import '../db_providers/database_provider.dart';

// Supplier Dao Provider
final supplierDaoProvider = Provider<SupplierDao>((ref) {
  final database = ref.watch(databaseProvider);
  return SupplierDao(database);
});

// supplier Notifier Provider
final supplierNotifierProvider =
    StateNotifierProvider<SupplierNotifier, List<SupplierData>>((ref) {
  final database = AppDatabase.getInstance(); // Use your singleton instance
  return SupplierNotifier(SupplierDao(database))
    ..loadSuppliers(); // Load initial suppliers
});

// supplier By ID Provide
final supplierByIdProvider =
    FutureProvider.family<SupplierData?, int>((ref, supplierId) {
  final supplierDao = ref.watch(supplierDaoProvider);
  return supplierDao.getSupplierById(supplierId);
});
