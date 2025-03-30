import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/app_database.dart';
import '../../repository/customer_dao.dart';

class CustomerNotifier extends StateNotifier<List<CustomerData>> {
  final CustomerDao customerDao;

  CustomerNotifier(this.customerDao) : super([]);

  Future<void> loadCustomers() async {
    final customers = await customerDao.getAllCustomers();
    state = customers; // Load customers from the database
  }

  Future<void> addCustomer(CustomersCompanion customerCompanion) async {
    // Check if customer with the same name exists
    final existenceMap = await customerDao.checkCustomerExistence(
        customerCompanion.name.value, null);

    if (existenceMap['name'] == true) {
      throw Exception("Customer with this name already exists.");
    }

    // Insert the customer and get the newly created CustomerData
    final id = await customerDao.insertCustomer(customerCompanion);
    // Load the customer data after insertion
    final newCustomer = await customerDao.getCustomerById(id);
    if (newCustomer != null) {
      state = [...state, newCustomer]; // Update the state with the new customer
    }
  }

  Future<void> updateCustomer(CustomersCompanion updatedCustomer) async {
    await customerDao
        .updateCustomer(updatedCustomer); // Call update method in DAO
    await loadCustomers(); // Refresh the list after updating
  }

  Future<void> deleteCustomer(int id) async {
    await customerDao.deleteCustomer(id); // Call the delete method in DAO
    await loadCustomers(); // Refresh the list after deletion
  }
}
