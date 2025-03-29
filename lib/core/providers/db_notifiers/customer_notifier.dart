import 'package:drift/drift.dart';
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

  Future<void> addCustomer(CustomerData customerData) async {
    // Create an instance of CustomersCompanion from CustomerData
    final customerCompanion = CustomersCompanion(
      name: Value(customerData.name),
      phoneNumber: Value(customerData.phoneNumber),
      street: Value(customerData.street),
      postalCode: Value(customerData.postalCode),
      city: Value(customerData.city),
      state: Value(customerData.state),
      country: Value(customerData.country),
    );

    await customerDao.insertCustomer(customerCompanion);
    await loadCustomers(); // Refresh the list after adding a new customer
  }
}

final customerProvider =
    StateNotifierProvider<CustomerNotifier, List<CustomerData>>((ref) {
  final database = AppDatabase.getInstance(); // Use your singleton instance
  return CustomerNotifier(CustomerDao(database))
    ..loadCustomers(); // Load initial customers
});
