import 'package:drift/drift.dart' as drift;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../core/database/drift/app_database.dart';
import '../../../../../core/providers/customer_providers/customer_related_providers.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../widgets/address_form.dart';

class EditCustomerForm extends ConsumerWidget {
  final int customerId;

  EditCustomerForm({super.key, required this.customerId});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customer = ref.watch(customerNotifierProvider.select(
        (customers) => customers.firstWhere((c) => c.id == customerId)));

    final nameController = TextEditingController(text: customer.name);
    final phoneController = TextEditingController(text: customer.phoneNumber);
    final streetController = TextEditingController(text: customer.street);
    final postalCodeController =
        TextEditingController(text: customer.postalCode);
    final cityController = TextEditingController(text: customer.city);
    final stateController = TextEditingController(text: customer.state);
    final countryController = TextEditingController(text: customer.country);

    return Scaffold(
      appBar: VAppBar(
        title: const Text('Edit Customer'),
        actions: [
          IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(CupertinoIcons.xmark))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Form(
            key: _formKey,
            child: AddressForm(
              nameController: nameController,
              phoneController: phoneController,
              streetController: streetController,
              postalCodeController: postalCodeController,
              cityController: cityController,
              stateController: stateController,
              countryController: countryController,
              buttonText: 'Update Customer',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final updatedCustomer = CustomersCompanion(
                    id: drift.Value(customer.id),
                    name: drift.Value(nameController.text),
                    phoneNumber: phoneController.text.isEmpty
                        ? const drift.Value(null)
                        : drift.Value(phoneController.text),
                    street: streetController.text.isEmpty
                        ? const drift.Value(null)
                        : drift.Value(streetController.text),
                    postalCode: postalCodeController.text.isEmpty
                        ? const drift.Value(null)
                        : drift.Value(postalCodeController.text),
                    city: cityController.text.isEmpty
                        ? const drift.Value(null)
                        : drift.Value(cityController.text),
                    state: stateController.text.isEmpty
                        ? const drift.Value(null)
                        : drift.Value(stateController.text),
                    country: countryController.text.isEmpty
                        ? const drift.Value(null)
                        : drift.Value(countryController.text),
                  );

                  await ref
                      .read(customerNotifierProvider.notifier)
                      .updateCustomer(updatedCustomer);
                  if (!context.mounted) return;
                  context.pop();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
