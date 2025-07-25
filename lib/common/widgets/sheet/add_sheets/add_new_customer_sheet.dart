import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/common/widgets/text/section_heading.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../core/database/drift/app_database.dart';
import '../../../../core/providers/common_providers/default_providers.dart';
import '../../../../core/providers/customer_providers/customer_related_providers.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/messages/snackbar.dart';
import '../../../../core/utils/messages/toast.dart';

class AddNewCustomerBottomSheet extends ConsumerStatefulWidget {
  const AddNewCustomerBottomSheet({super.key});

  @override
  ConsumerState<AddNewCustomerBottomSheet> createState() =>
      _AddNewCustomerBottomSheetState();
}

class _AddNewCustomerBottomSheetState
    extends ConsumerState<AddNewCustomerBottomSheet> {
  String input = '';
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.of(context).pop(input.trim());
    VToast.success(message: context.loc.customerAddedSuccessfully);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: VSpacingStyle.responseKeyboard(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSectionHeading(
                title: context.loc.addNewCustomer, showActionButton: false),
            const SizedBox(height: VSizes.spaceBtwSections),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _controller,
                autofocus: true,
                decoration:
                    InputDecoration(hintText: context.loc.enterCustomerName),
                onChanged: (val) => setState(() => input = val),
                onFieldSubmitted: (_) => _submit(),
                validator: (value) => value == null || value.trim().isEmpty
                    ? context.loc.pleaseEnterName
                    : null,
              ),
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.pop(),
                    child: Text(context.loc.cancel),
                  ),
                ),
                const SizedBox(width: VSizes.spaceBtwItems),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: Text(context.loc.add),
                  ),
                ),
              ],
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}

Future<void> addNewCustomerBottomSheet(
    BuildContext context, WidgetRef ref) async {
  final customerNotifier = ref.read(customerNotifierProvider.notifier);

  final newCustomerName = await showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    builder: (context) => const AddNewCustomerBottomSheet(),
  );

  if (newCustomerName != null && newCustomerName.isNotEmpty) {
    try {
      final newCustomer =
          CustomersCompanion(name: drift.Value(newCustomerName));
      final newCustomerId = await customerNotifier.addCustomer(newCustomer);

      ref.read(customerIDProvider.notifier).state = newCustomerId;
      ref.read(customerNameProvider.notifier).state = newCustomerName;
      ref.read(customerPhoneProvider.notifier).state = '';
      ref.read(customerAddressProvider.notifier).state = '';
    } catch (e) {
      if (context.mounted) {
        VSnackbar.error('${context.loc.errorAddingCustomer}: ${e.toString()}');
      }
    }
  }
}
