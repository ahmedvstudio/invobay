import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/widgets/text/section_heading.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../../../../core/utils/messages/toast.dart';
import '../../../styles/spacing_style.dart';

Future<void> showTaxEditBottomSheet(BuildContext context, WidgetRef ref) async {
  final currentTax = ref.read(appSettingsProvider).value?.taxPercentage ?? 0.0;
  final isDark = VHelperFunctions.isDarkMode(context);
  final taxController = TextEditingController();

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius:
          BorderRadius.vertical(top: Radius.circular(VSizes.defaultSpace)),
    ),
    builder: (context) {
      return Padding(
        padding: VSpacingStyle.responseKeyboard(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSectionHeading(
              title: context.loc.editTaxPercentage,
              buttonTitle: '%$currentTax',
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            TextFormField(
              controller: taxController,
              textAlign: TextAlign.center,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
              ],
              decoration: InputDecoration(
                labelText: context.loc.tax,
                prefixIcon: Icon(
                  Iconsax.discount_circle,
                  color: isDark
                      ? VColors.light.withAlpha(128)
                      : VColors.dark.withAlpha(128),
                ),
                hintText: context.loc.enterTaxPercentage,
              ),
            ),
            const SizedBox(height: VSizes.spaceBtwSections),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.pop(),
                    child: Text(context.loc.cancel),
                  ),
                ),
                const SizedBox(width: VSizes.defaultSpace),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final input = taxController.text.trim();
                      final parsed = double.tryParse(input);

                      if (parsed == null || parsed < 0) {
                        VToast.error(
                          message: context.loc.enterValidPositiveNumber,
                        );
                        return;
                      }

                      final old = ref.read(appSettingsProvider).value;
                      if (old != null) {
                        final updated = old.copyWith(taxPercentage: parsed);
                        await ref
                            .read(appSettingsProvider.notifier)
                            .updateSettings(updated);
                        if (!context.mounted) return;
                        VToast.info(
                            message: context.loc.taxPercentageUpdatedSaved);
                      }

                      if (context.mounted) context.pop();
                    },
                    child: Text(context.loc.save),
                  ),
                ),
              ],
            ),
            const SizedBox(height: VSizes.defaultSpace),
          ],
        ),
      );
    },
  );
}
