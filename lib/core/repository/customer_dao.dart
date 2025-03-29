import 'package:drift/drift.dart';
import '../database/app_database.dart';

class CustomerDao {
  final AppDatabase db;

  CustomerDao(this.db);

  // Insert a new customer into the database
  Future<int> insertCustomer(CustomersCompanion customer) {
    return db.into(db.customers).insert(customer);
  }

  // Get all customers from the database
  Future<List<CustomerData>> getAllCustomers() {
    return db.select(db.customers).get();
  }

  // Get a single customer by its ID
  Future<CustomerData?> getCustomerById(int? id) async {
    return await (db.select(db.customers)..where((tbl) => tbl.id.equals(id!)))
        .getSingleOrNull();
  }

  // Update an existing customer
  Future<void> updateCustomer(CustomersCompanion customer) {
    return db.update(db.customers).replace(customer);
  }

  // Delete a customer by its ID
  Future<void> deleteCustomer(int id) {
    return (db.delete(db.customers)..where((tbl) => tbl.id.equals(id))).go();
  }

  // Search for customers by name
  Future<List<CustomerData>> searchCustomers(String query) {
    final queryStatement = db.select(db.customers)
      ..where(
        (customer) => customer.name.like('%$query%'),
      );

    return queryStatement.get(); // This returns a Future<List<CustomerData>>
  }

  // Check if a customer exists by their name or phone number
  Future<Map<String, bool>> checkCustomerExistence(
      String name, String? phoneNumber) async {
    bool nameExists = false;
    bool phoneExists = false;

    // Check if a customer with the same name exists
    final nameQuery = await (db.select(db.customers)
          ..where((tbl) => tbl.name.equals(name)))
        .get();
    if (nameQuery.isNotEmpty) nameExists = true;

    // Check if a customer with the same phone number exists
    if (phoneNumber != null && phoneNumber.isNotEmpty) {
      final phoneQuery = await (db.select(db.customers)
            ..where((tbl) => tbl.phoneNumber.equals(phoneNumber)))
          .get();
      if (phoneQuery.isNotEmpty) phoneExists = true;
    }

    // Return a map with the existence of the customer by name and phone number
    return {'name': nameExists, 'phone': phoneExists};
  }
}
