import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/messages/toast.dart';

import '../../../core/database/drift/app_database.dart';
import '../../../core/providers/customer_providers/customer_related_providers.dart';
import '../../../core/providers/common_providers/default_providers.dart';
import '../../../core/utils/messages/snackbar.dart';

Future<void> addNewCustomerDialog(BuildContext context, WidgetRef ref) async {
  String? newCustomerName;
  final customerNotifier = ref.read(customerNotifierProvider.notifier);

  await showDialog<String>(
    context: context,
    builder: (context) {
      String input = '';
      return AlertDialog(
        title: const Text('Add New Customer'),
        content: TextField(
          onChanged: (value) {
            input = value;
          },
          decoration: const InputDecoration(hintText: 'Enter customer name'),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (input.isNotEmpty) {
                newCustomerName = input;
                context.pop();
                VToast.success(message: 'Customer added successfully');
              } else {
                VToast.error(message: 'Customer name cannot be empty');
              }
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );

  if (newCustomerName != null && newCustomerName!.isNotEmpty) {
    try {
      final newCustomer =
          CustomersCompanion(name: drift.Value(newCustomerName!));

      // Add the customer and get the generated ID
      final newCustomerId = await customerNotifier.addCustomer(newCustomer);

      // Update the customer ID provider
      ref.read(customerIDProvider.notifier).state = newCustomerId;

      // Reset other customer details
      ref.read(customerNameProvider.notifier).state = newCustomerName!;
      ref.read(customerPhoneProvider.notifier).state = '';
      ref.read(customerAddressProvider.notifier).state = '';
    } catch (e) {
      if (!context.mounted) return;
      VSnackbar.error(
          context: context, message: 'Error adding customer: ${e.toString()}');
    }
  }
}
