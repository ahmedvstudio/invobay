import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/app_database.dart';
import '../../repository/supplier_dao.dart';

class SupplierNotifier extends StateNotifier<List<SupplierData>> {
  final SupplierDao supplierDao;

  SupplierNotifier(this.supplierDao) : super([]);

  Future<void> loadSuppliers() async {
    final suppliers = await supplierDao.getAllSuppliers();
    state = suppliers;
  }

  Future<void> addSupplier(SuppliersCompanion supplierCompanion) async {
    final id = await supplierDao.insertSupplier(supplierCompanion);
    final newSupplier = await supplierDao.getSupplierById(id);
    if (newSupplier != null) {
      state = [...state, newSupplier];
    }
  }

  Future<void> updateSupplier(SuppliersCompanion updatedSupplier) async {
    await supplierDao
        .updateSupplier(updatedSupplier); // Call update method in DAO
    await loadSuppliers(); // Refresh the list after updating
  }
}

final supplierProvider =
    StateNotifierProvider<SupplierNotifier, List<SupplierData>>((ref) {
  final database = AppDatabase.getInstance(); // Use your singleton instance
  return SupplierNotifier(SupplierDao(database))..loadSuppliers();
});
