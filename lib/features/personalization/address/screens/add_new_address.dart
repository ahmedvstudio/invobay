import 'package:drift/drift.dart' as drift;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/features/personalization/address/widgets/address_form.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/providers/db_notifiers/customer_notifier.dart';
import '../../../../core/providers/db_notifiers/supplier_notifier.dart';
import '../../../../core/utils/constants/sizes.dart';

class AddNewAddress extends ConsumerWidget {
  final bool isCustomer;

  AddNewAddress({
    super.key,
    required this.isCustomer,
  });

  final _formKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final streetController = TextEditingController();
    final postalCodeController = TextEditingController();
    final cityController = TextEditingController();
    final stateController = TextEditingController();
    final countryController = TextEditingController();

    return Scaffold(
      appBar: VAppBar(
        actions: [
          IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(CupertinoIcons.xmark))
        ],
        title: Text(isCustomer ? 'Add new Customer' : 'Add new Supplier'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Form(
            key: _formKey3,
            child: AddressForm(
              nameController: nameController,
              phoneController: phoneController,
              streetController: streetController,
              postalCodeController: postalCodeController,
              cityController: cityController,
              stateController: stateController,
              countryController: countryController,
              buttonText: isCustomer ? 'Save Customer' : 'Save Supplier',
              onPressed: isCustomer
                  ? () async {
                      if (_formKey3.currentState!.validate()) {
                        /// add New Customer
                        final newCustomer = CustomersCompanion(
                          name: drift.Value(nameController.text),
                          phoneNumber: phoneController.text.isEmpty
                              ? const drift.Value.absent()
                              : drift.Value(phoneController.text),
                          street: streetController.text.isEmpty
                              ? const drift.Value.absent()
                              : drift.Value(streetController.text),
                          postalCode: postalCodeController.text.isEmpty
                              ? const drift.Value.absent()
                              : drift.Value(postalCodeController.text),
                          city: cityController.text.isEmpty
                              ? const drift.Value.absent()
                              : drift.Value(cityController.text),
                          state: stateController.text.isEmpty
                              ? const drift.Value.absent()
                              : drift.Value(stateController.text),
                          country: countryController.text.isEmpty
                              ? const drift.Value.absent()
                              : drift.Value(countryController.text),
                        );

                        await ref
                            .read(customerProvider.notifier)
                            .addCustomer(newCustomer);
                        if (!context.mounted) return;
                        context.pop();
                      }
                    }

                  /// add New Supplier
                  : () async {
                      if (_formKey3.currentState!.validate()) {
                        final newSupplier = SuppliersCompanion(
                          name: drift.Value(nameController.text),
                          phoneNumber: phoneController.text.isEmpty
                              ? const drift.Value.absent()
                              : drift.Value(phoneController.text),
                          street: streetController.text.isEmpty
                              ? const drift.Value.absent()
                              : drift.Value(streetController.text),
                          postalCode: postalCodeController.text.isEmpty
                              ? const drift.Value.absent()
                              : drift.Value(postalCodeController.text),
                          city: cityController.text.isEmpty
                              ? const drift.Value.absent()
                              : drift.Value(cityController.text),
                          state: stateController.text.isEmpty
                              ? const drift.Value.absent()
                              : drift.Value(stateController.text),
                          country: countryController.text.isEmpty
                              ? const drift.Value.absent()
                              : drift.Value(countryController.text),
                        );

                        await ref
                            .read(supplierProvider.notifier)
                            .addSupplier(newSupplier);
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
