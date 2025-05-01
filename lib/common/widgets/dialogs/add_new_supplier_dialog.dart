import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/messages/snackbar.dart';
import 'package:invobay/core/utils/messages/toast.dart';

import '../../../core/database/drift/app_database.dart';
import '../../../core/providers/common_providers/default_providers.dart';
import '../../../core/providers/supplier_providers/supplier_related_providers.dart';

Future<void> addNewSupplierDialog(BuildContext context, WidgetRef ref) async {
  String? newSupplierName;
  final supplierNotifier = ref.read(supplierNotifierProvider.notifier);

  await showDialog<String>(
    context: context,
    builder: (context) {
      String input = '';
      return AlertDialog(
        title: const Text('Add New Supplier'),
        content: TextField(
          onChanged: (value) {
            input = value;
          },
          decoration: const InputDecoration(hintText: 'Enter supplier name'),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (input.isNotEmpty) {
                newSupplierName = input;
                context.pop();
                VToast.success(message: 'Supplier added successfully');
              } else {
                VToast.error(message: 'Supplier name cannot be empty');
              }
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );

  if (newSupplierName != null && newSupplierName!.isNotEmpty) {
    try {
      final newSupplier =
          SuppliersCompanion(name: drift.Value(newSupplierName!));

      // Add the supplier and get the generated ID
      final newSupplierId = await supplierNotifier.addSupplier(newSupplier);

      // Update the supplier ID provider
      ref.read(supplierIDProvider.notifier).state = newSupplierId;

      // Reset other supplier details
      ref.read(supplierNameProvider.notifier).state = newSupplierName!;
      ref.read(supplierPhoneProvider.notifier).state = '';
      ref.read(supplierAddressProvider.notifier).state = '';
    } catch (e) {
      if (!context.mounted) return;
      VSnackbar.error(
          context: context, message: 'Error adding supplier: ${e.toString()}');
    }
  }
}
