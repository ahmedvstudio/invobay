import 'package:drift/drift.dart';
import '../database/drift/app_database.dart';

class SupplierDao {
  final AppDatabase db;

  SupplierDao(this.db);

  Future<int> insertSupplier(SuppliersCompanion supplier) {
    return db.into(db.suppliers).insert(supplier);
  }

  Future<List<SupplierData>> getAllSuppliers() {
    return db.select(db.suppliers).get();
  }

  Future<SupplierData?> getSupplierById(int? id) async {
    return await (db.select(db.suppliers)..where((tbl) => tbl.id.equals(id!)))
        .getSingleOrNull();
  }

  Future<void> updateSupplier(SuppliersCompanion supplier) {
    return db.update(db.suppliers).replace(supplier);
  }

  Future<void> deleteSupplier(int id) {
    return (db.delete(db.suppliers)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<List<SupplierData>> searchSuppliers(String query) {
    final queryStatement = db.select(db.suppliers)
      ..where(
        (supplier) => supplier.name.like('%$query%'),
      );

    return queryStatement.get();
  }

  Future<Map<String, bool>> checkSupplierExistence(
      String name, String? phoneNumber) async {
    bool nameExists = false;
    bool phoneExists = false;

    final nameQuery = await (db.select(db.suppliers)
          ..where((tbl) => tbl.name.equals(name)))
        .get();
    if (nameQuery.isNotEmpty) nameExists = true;

    if (phoneNumber != null && phoneNumber.isNotEmpty) {
      final phoneQuery = await (db.select(db.suppliers)
            ..where((tbl) => tbl.phoneNumber.equals(phoneNumber)))
          .get();
      if (phoneQuery.isNotEmpty) phoneExists = true;
    }

    return {'name': nameExists, 'phone': phoneExists};
  }
}
