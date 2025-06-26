import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';

class VDeleteConfirmDialog extends StatelessWidget {
  const VDeleteConfirmDialog({
    super.key,
    this.isCustomer = true,
    this.isGeneral = false,
    this.contentText,
  });

  final bool isCustomer;
  final bool isGeneral;
  final String? contentText;

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return Dialog(
      backgroundColor: isDark ? VColors.dark : VColors.light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(VSizes.borderRadiusXl),
      ),
      insetPadding: VSpacingStyle.symmetric,
      child: Padding(
        padding: VSpacingStyle.all,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.warning_amber_rounded,
                size: VSizes.iconXl, color: VColors.error),
            const SizedBox(height: VSizes.spaceBtwItems),
            Text(
              context.loc.confirmDeletion,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            Text(
              isGeneral
                  ? contentText ?? context.loc.areYouSureYouWantToDeleteThis
                  : isCustomer
                      ? context.loc.areYouSureYouWantToDeleteThisCustomer
                      : context.loc.areYouSureYouWantToDeleteThisSupplier,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.pop(false),
                    child: Text(context.loc.cancel),
                  ),
                ),
                const SizedBox(width: VSizes.spaceBtwItems),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => context.pop(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: VColors.error,
                      foregroundColor: Colors.white,
                      side: BorderSide.none,
                    ),
                    child: Text(context.loc.delete),
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
