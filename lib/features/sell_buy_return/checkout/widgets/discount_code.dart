import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/providers/db_providers/hive_providers/app_settings_provider.dart';
import 'package:invobay/core/utils/messages/snackbar.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../core/providers/common_providers/default_providers.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../common/widgets/dialogs/discount_type_dialog.dart';
import '../../../../core/utils/constants/enums.dart';

class VDiscountCode extends ConsumerWidget {
  VDiscountCode({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = VHelperFunctions.isDarkMode(context);
    final discountApplied = ref.watch(discountAppliedProvider);
    final discountController = ref.watch(discountControllerProvider);
    final discountType = ref.watch(discountTypeProvider);
    final currencySign = ref.watch(currencySignProvider);
    final subtotal = ref.watch(subtotalPriceProvider);

    return Form(
      key: _formKey,
      child: VRoundedContainer(
        showBorder: true,
        backgroundColor: isDark ? VColors.dark : VColors.white,
        padding: const EdgeInsets.only(
          top: VSizes.sm,
          bottom: VSizes.sm,
          left: VSizes.md,
          right: VSizes.sm,
        ),
        child: Row(
          children: [
            /// Text Field
            Flexible(
              child: TextFormField(
                controller: discountController,
                decoration: InputDecoration(
                  hintText: discountType == DiscountType.percentage
                      ? 'Discount % here.'
                      : 'Discount amount here.',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  prefixText: discountType == DiscountType.percentage
                      ? '% '
                      : '$currencySign ',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  final numValue = double.tryParse(value ?? '');
                  if (numValue == null || numValue <= 0) {
                    return 'Enter a valid number';
                  }

                  if (discountType == DiscountType.percentage &&
                      numValue > 100) {
                    return 'Percentage cannot exceed 100%';
                  }

                  if (discountType == DiscountType.amount &&
                      numValue > subtotal) {
                    return 'Discount cannot exceed subtotal ($currencySign${subtotal.toStringAsFixed(2)})';
                  }

                  return null;
                },
                enabled: !discountApplied,
              ),
            ),

            /// Apply / Undo Button
            SizedBox(
              width: 80,
              child: ElevatedButton(
                onLongPress: () async {
                  final typeNotifier = ref.read(discountTypeProvider.notifier);
                  final selectedType = await showDialog<DiscountType>(
                    context: context,
                    builder: (context) =>
                        VDiscountTypeDialog(currencySign: currencySign),
                  );

                  if (selectedType != null && context.mounted) {
                    typeNotifier.state = selectedType;
                  }
                },
                onPressed: () async {
                  final discountNotifier = ref.read(discountProvider.notifier);
                  final appliedNotifier =
                      ref.read(discountAppliedProvider.notifier);
                  final typeNotifier = ref.read(discountTypeProvider.notifier);

                  if (discountApplied) {
                    // Undo logic
                    discountNotifier.state = 0.0;
                    discountController.clear();
                    typeNotifier.state = DiscountType.percentage; // reset type
                    appliedNotifier.state = false;
                  } else {
                    // Ask for discount type first

                    // Then validate and apply discount
                    if (_formKey.currentState!.validate()) {
                      final enteredValue =
                          double.tryParse(discountController.text.trim()) ??
                              0.0;

                      // Final check just in case
                      if (discountType == DiscountType.percentage &&
                          enteredValue > 100) {
                        VSnackbar.error('Percentage cannot exceed 100%');
                        return;
                      }

                      if (discountType == DiscountType.amount &&
                          enteredValue > subtotal) {
                        VSnackbar.error(
                          'Discount cannot exceed subtotal ($currencySign${subtotal.toStringAsFixed(2)})',
                        );
                        return;
                      }

                      discountNotifier.state = enteredValue;
                      appliedNotifier.state = true;
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: VColors.white,
                  backgroundColor:
                      discountApplied ? VColors.error : VColors.success,
                ),
                child: Text(discountApplied ? 'Undo' : 'Apply'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
