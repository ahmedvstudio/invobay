import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../core/providers/discount_provider.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';
import '../../../core/utils/validators/validation.dart';

class VDiscountCode extends ConsumerWidget {
  VDiscountCode({
    super.key,
  });
  final _formKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = VHelperFunctions.isDarkMode(context);
    final discountApplied = ref.watch(discountAppliedProvider);
    final discountController = ref.watch(discountControllerProvider);

    return Form(
      key: _formKey3,
      child: VRoundedContainer(
        showBorder: true,
        backgroundColor: isDark ? VColors.dark : VColors.white,
        padding: const EdgeInsets.only(
            top: VSizes.sm,
            bottom: VSizes.sm,
            left: VSizes.sm,
            right: VSizes.sm),
        child: Row(
          children: [
            Flexible(
              child: TextFormField(
                controller: discountController,
                decoration: const InputDecoration(
                  hintText: 'Enter discount % here.',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
                validator: VValidator.validateDiscountNumber,
              ),
            ),

            // button
            SizedBox(
              width: 80,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey3.currentState!.validate()) {
                    final discount =
                        double.tryParse(discountController.text) ?? 0.0;
                    final discountNotifier =
                        ref.read(discountProvider.notifier);
                    final appliedNotifier =
                        ref.read(discountAppliedProvider.notifier);

                    if (discountApplied) {
                      // Undo: Reset discount and clear text field
                      discountNotifier.state = 0.0;
                      discountController.clear();
                    } else {
                      // Apply: Store discount and keep text field value
                      discountNotifier.state = discount;
                    }

                    // Toggle discount applied state
                    appliedNotifier.state = !discountApplied;
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: isDark
                      ? VColors.white.withValues(alpha: 0.5)
                      : VColors.dark.withValues(alpha: 0.5),
                  backgroundColor: discountApplied
                      ? VColors.kPrimary.withValues(alpha: 0.2)
                      : VColors.darkGrey.withValues(alpha: 0.2),
                  side: BorderSide(
                    color: VColors.darkerGrey.withValues(alpha: 0.1),
                  ),
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
