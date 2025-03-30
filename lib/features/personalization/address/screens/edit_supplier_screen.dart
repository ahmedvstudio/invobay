import 'package:drift/drift.dart' as drift;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/providers/db_notifiers/app_providers.dart';
import '../../../../core/utils/constants/sizes.dart';
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
    final postalCodeController =
        TextEditingController(text: supplier.postalCode);
    final cityController = TextEditingController(text: supplier.city);
    final stateController = TextEditingController(text: supplier.state);
    final countryController = TextEditingController(text: supplier.country);

    return Scaffold(
      appBar: VAppBar(
        title: const Text('Edit Supplier'),
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
              buttonText: 'Update Supplier',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final updatedSupplier = SuppliersCompanion(
                    id: drift.Value(supplier.id),
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
