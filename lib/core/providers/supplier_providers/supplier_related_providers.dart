import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/database/app_database.dart';
import 'package:invobay/core/providers/supplier_providers/supplier_notifier.dart';

import '../../repository/supplier_dao.dart';

// Supplier Notifier Provider
final supplierNotifierProvider =
    StateNotifierProvider<SupplierNotifier, List<SupplierData>>((ref) {
  final database = AppDatabase.getInstance(); // Use your singleton instance
  return SupplierNotifier(SupplierDao(database))..loadSuppliers();
});
