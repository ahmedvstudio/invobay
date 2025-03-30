import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/providers/db_notifiers/customer_notifier.dart';

class EditCustomerForm extends ConsumerWidget {
  final int customerId; // The customer ID to edit

  const EditCustomerForm({super.key, required this.customerId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customer = ref.watch(customerProvider.select(
        (customers) => customers.firstWhere((c) => c.id == customerId)));

    // Controllers for each input field
    final nameController = TextEditingController(text: customer.name);
    final phoneController = TextEditingController(text: customer.phoneNumber);
    final streetController = TextEditingController(text: customer.street);
    final postalCodeController =
        TextEditingController(text: customer.postalCode);
    final cityController = TextEditingController(text: customer.city);
    final stateController = TextEditingController(text: customer.state);
    final countryController = TextEditingController(text: customer.country);

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Customer')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: streetController,
                  decoration: const InputDecoration(labelText: 'Street'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: postalCodeController,
                  decoration: const InputDecoration(labelText: 'Postal Code'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: cityController,
                  decoration: const InputDecoration(labelText: 'City'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: stateController,
                  decoration: const InputDecoration(labelText: 'State'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: countryController,
                  decoration: const InputDecoration(labelText: 'Country'),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Create an instance of CustomersCompanion for update
                      final updatedCustomer = CustomersCompanion(
                        id: drift.Value(customer.id), // Pass the existing ID
                        name: drift.Value(nameController.text),
                        phoneNumber: drift.Value(phoneController.text),
                        street: drift.Value(streetController.text),
                        postalCode: drift.Value(postalCodeController.text),
                        city: drift.Value(cityController.text),
                        state: drift.Value(stateController.text),
                        country: drift.Value(countryController.text),
                      );

                      // Call the update method in your notifier
                      await ref
                          .read(customerProvider.notifier)
                          .updateCustomer(updatedCustomer);
                      if (!context.mounted) return;
                      context.pop();
                    },
                    child: const Text('Update'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
