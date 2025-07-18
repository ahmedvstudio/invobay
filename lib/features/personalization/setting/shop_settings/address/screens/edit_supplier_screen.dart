import 'package:drift/drift.dart' as drift;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../../core/database/drift/app_database.dart';
import '../../../../../../core/providers/supplier_providers/supplier_related_providers.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../widgets/address_form.dart';

class EditSupplierForm extends ConsumerWidget {
  final int supplierId;

  EditSupplierForm({super.key, required this.supplierId});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supplier = ref.watch(supplierNotifierProvider.select(
        (suppliers) => suppliers.firstWhere((c) => c.id == supplierId)));

    final nameController = TextEditingController(text: supplier.name);
    final phoneController = TextEditingController(text: supplier.phoneNumber);
    final streetController = TextEditingController(text: supplier.street);
    final extraPhoneNumberController =
        TextEditingController(text: supplier.extraPhoneNumber);
    final cityController = TextEditingController(text: supplier.city);
    final stateController = TextEditingController(text: supplier.state);
    final countryController = TextEditingController(text: supplier.country);

    return Scaffold(
      appBar: VAppBar(
        title: Text(context.loc.editSupplier),
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
              cityController: cityController,
              stateController: stateController,
              countryController: countryController,
              extraPhoneNumberController: extraPhoneNumberController,
              buttonText: context.loc.updateSupplier,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final updatedSupplier = SuppliersCompanion(
                    id: drift.Value(supplier.id),
                    name: drift.Value(nameController.text),
                    phoneNumber: phoneController.text.isEmpty
                        ? const drift.Value(null)
                        : drift.Value(phoneController.text),
                    street: streetController.text.isEmpty
                        ? const drift.Value(null)
                        : drift.Value(streetController.text),
                    extraPhoneNumber: extraPhoneNumberController.text.isEmpty
                        ? const drift.Value(null)
                        : drift.Value(extraPhoneNumberController.text),
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
                      .read(supplierNotifierProvider.notifier)
                      .updateSupplier(updatedSupplier);
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
