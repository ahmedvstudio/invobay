import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/common/widgets/text/section_heading.dart';
import '../../../../core/database/drift/app_database.dart';
import '../../../../core/providers/common_providers/default_providers.dart';
import '../../../../core/providers/supplier_providers/supplier_related_providers.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/messages/snackbar.dart';
import '../../../../core/utils/messages/toast.dart';

class AddNewSupplierBottomSheet extends ConsumerStatefulWidget {
  const AddNewSupplierBottomSheet({super.key});

  @override
  ConsumerState<AddNewSupplierBottomSheet> createState() =>
      _AddNewSupplierBottomSheetState();
}

class _AddNewSupplierBottomSheetState
    extends ConsumerState<AddNewSupplierBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  String input = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.pop(input.trim());
    VToast.success(message: 'Supplier added successfully');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: VSpacingStyle.responseKeyboard(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const VSectionHeading(
                title: 'Add New Supplier', showActionButton: false),
            const SizedBox(height: VSizes.spaceBtwSections),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _controller,
                autofocus: true,
                decoration:
                    const InputDecoration(hintText: 'Enter supplier name'),
                onChanged: (val) => setState(() => input = val),
                onFieldSubmitted: (_) => _submit(),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Please enter a name'
                    : null,
              ),
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: VSizes.spaceBtwItems),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: const Text('Add'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> addNewSupplierBottomSheet(
    BuildContext context, WidgetRef ref) async {
  final supplierNotifier = ref.read(supplierNotifierProvider.notifier);

  final newSupplierName = await showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    builder: (context) => const AddNewSupplierBottomSheet(),
  );

  if (newSupplierName != null && newSupplierName.isNotEmpty) {
    try {
      final newSupplier =
          SuppliersCompanion(name: drift.Value(newSupplierName));
      final newSupplierId = await supplierNotifier.addSupplier(newSupplier);

      ref.read(supplierIDProvider.notifier).state = newSupplierId;
      ref.read(supplierNameProvider.notifier).state = newSupplierName;
      ref.read(supplierPhoneProvider.notifier).state = '';
      ref.read(supplierAddressProvider.notifier).state = '';
    } catch (e) {
      if (!context.mounted) return;
      VSnackbar.error(
          context: context, message: 'Error adding supplier: ${e.toString()}');
    }
  }
}
