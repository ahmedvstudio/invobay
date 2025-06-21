import 'package:drift/drift.dart' as drift;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../../core/database/drift/app_database.dart';
import '../../../../../../core/providers/customer_providers/customer_related_providers.dart';
import '../../../../../../core/providers/supplier_providers/supplier_related_providers.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/messages/snackbar.dart';
import '../widgets/address_form.dart';

class AddNewAddress extends ConsumerWidget {
  final bool isCustomer;

  AddNewAddress({
    super.key,
    required this.isCustomer,
  });

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final streetController = TextEditingController();
    final extraPhoneNumberController = TextEditingController();
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
        title: Text(isCustomer
            ? context.loc.addNewCustomer
            : context.loc.addNewSupplier),
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
              extraPhoneNumberController: extraPhoneNumberController,
              cityController: cityController,
              stateController: stateController,
              countryController: countryController,
              buttonText: isCustomer
                  ? context.loc.saveCustomer
                  : context.loc.saveSupplier,
              onPressed: isCustomer
                  ? () async {
                      if (_formKey.currentState!.validate()) {
                        /// add New Customer
                        final newCustomer = CustomersCompanion(
                          name: drift.Value(nameController.text),
                          phoneNumber: phoneController.text.isEmpty
                              ? const drift.Value.absent()
                              : drift.Value(phoneController.text),
                          street: streetController.text.isEmpty
                              ? const drift.Value.absent()
                              : drift.Value(streetController.text),
                          extraPhoneNumber: extraPhoneNumberController
                                  .text.isEmpty
                              ? const drift.Value.absent()
                              : drift.Value(extraPhoneNumberController.text),
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
                        try {
                          await ref
                              .read(customerNotifierProvider.notifier)
                              .addCustomer(newCustomer);
                          if (!context.mounted) return;
                          context.pop();
                        } catch (e) {
                          VSnackbar.error(
                              context.loc.customerWithThisNameAlreadyExists);
                        }
                      }
                    }

                  /// add New Supplier
                  : () async {
                      if (_formKey.currentState!.validate()) {
                        final newSupplier = SuppliersCompanion(
                          name: drift.Value(nameController.text),
                          phoneNumber: phoneController.text.isEmpty
                              ? const drift.Value.absent()
                              : drift.Value(phoneController.text),
                          street: streetController.text.isEmpty
                              ? const drift.Value.absent()
                              : drift.Value(streetController.text),
                          extraPhoneNumber: extraPhoneNumberController
                                  .text.isEmpty
                              ? const drift.Value.absent()
                              : drift.Value(extraPhoneNumberController.text),
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
                        try {
                          await ref
                              .read(supplierNotifierProvider.notifier)
                              .addSupplier(newSupplier);
                          if (!context.mounted) return;
                          context.pop();
                        } catch (e) {
                          VSnackbar.error(
                              context.loc.supplierWithThisNameAlreadyExists);
                        }
                      }
                    },
            ),
          ),
        ),
      ),
    );
  }
}
