import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

import '../../../core/database/app_database.dart';
import '../../../core/providers/db_notifiers/app_providers.dart';
import '../../../core/providers/default_providers.dart';

Future<void> addNewCustomerDialog(BuildContext context, WidgetRef ref) async {
  String? newCustomerName;

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
          TextButton(
            onPressed: () {
              if (input.isNotEmpty) {
                newCustomerName = input;
                context.pop();
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
      await ref
          .read(customerNotifierProvider.notifier)
          .addCustomer(newCustomer);
      ref.read(customerNameProvider.notifier).state = newCustomerName!;
    } catch (e) {
      if (!context.mounted) return;
      VHelperFunctions.showSnackBar(
          context: context, message: 'Error adding customer: ${e.toString()}');
    }
  }
}
