import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/drift/app_database.dart';
import '../../repository/supplier_dao.dart';

class SupplierNotifier extends StateNotifier<List<SupplierData>> {
  final SupplierDao supplierDao;

  SupplierNotifier(this.supplierDao) : super([]);

  Future<void> loadSuppliers() async {
    final suppliers = await supplierDao.getAllSuppliers();
    state = suppliers; // Load suppliers from the database
  }

  Future<int> addSupplier(SuppliersCompanion supplierCompanion) async {
    final existenceMap = await supplierDao.checkSupplierExistence(
        supplierCompanion.name.value, null);

    if (existenceMap['name'] == true) {
      throw Exception("Supplier with this name already exists.");
    }

    // Insert supplier and get the new ID
    final id = await supplierDao.insertSupplier(supplierCompanion);

    // Load the newly created supplier data
    final newSupplier = await supplierDao.getSupplierById(id);
    if (newSupplier != null) {
      state = [...state, newSupplier]; // Update state with the new supplier
    }

    return id; // Return the newly created supplier ID
  }

  Future<void> updateSupplier(SuppliersCompanion updatedSupplier) async {
    await supplierDao
        .updateSupplier(updatedSupplier); // Call update method in DAO
    await loadSuppliers(); // Refresh the list after updating
  }

  Future<void> deleteSupplier(int id) async {
    await supplierDao.deleteSupplier(id); // Call the delete method in DAO
    await loadSuppliers(); // Refresh the list after deletion
  }
}
