import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/database/drift/app_database.dart';

import '../../repository/customer_dao.dart';
import 'customer_notifier.dart';
import '../db_providers/database_provider.dart';

// Customer Dao Provider
final customerDaoProvider = Provider<CustomerDao>((ref) {
  final database = ref.watch(databaseProvider);
  return CustomerDao(database);
});

// Customer Notifier Provider
final customerNotifierProvider =
    StateNotifierProvider<CustomerNotifier, List<CustomerData>>((ref) {
  final database = AppDatabase.getInstance(); // Use your singleton instance
  return CustomerNotifier(CustomerDao(database))
    ..loadCustomers(); // Load initial customers
});

// Customer By ID Provide
final customerByIdProvider =
    FutureProvider.family<CustomerData?, int>((ref, customerId) {
  final customerDao = ref.watch(customerDaoProvider);
  return customerDao.getCustomerById(customerId);
});
