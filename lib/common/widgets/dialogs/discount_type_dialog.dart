import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/enums.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../styles/spacing_style.dart';

class VDiscountTypeDialog extends StatelessWidget {
  const VDiscountTypeDialog({
    super.key,
    required this.currencySign,
  });

  final String currencySign;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(VSizes.borderRadiusXl),
      ),
      insetPadding: VSpacingStyle.symmetric,
      child: Padding(
        padding: VSpacingStyle.all,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.info, size: VSizes.iconXl, color: VColors.info),
            const SizedBox(height: VSizes.spaceBtwItems),
            Text(
              'Change Discount Type',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            Text(
              'Switch between percentage and fixed amount.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.pop(DiscountType.percentage),
                    child: const Text(
                      'Percentage %',
                      maxLines: 1,
                    ),
                  ),
                ),
                const SizedBox(width: VSizes.spaceBtwItems),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.pop(DiscountType.amount),
                    child: Text(
                      'Amount $currencySign',
                      maxLines: 1,
                    ),
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
