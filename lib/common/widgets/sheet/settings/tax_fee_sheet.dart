import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../../../../core/utils/messages/snackbar.dart';
import '../../../../core/utils/messages/toast.dart';
import '../../../styles/spacing_style.dart';

Future<void> showTaxEditBottomSheet(BuildContext context, WidgetRef ref) async {
  final currentTax = ref.read(appSettingsProvider).value?.taxPercentage ?? 0.0;
  final isDark = VHelperFunctions.isDarkMode(context);
  final taxController = TextEditingController(text: currentTax.toString());

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
            Text(
              'Edit Tax Percentage',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: VSizes.spaceBtwSections),
            TextFormField(
              controller: taxController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
              ],
              decoration: InputDecoration(
                labelText: "Tax %",
                prefixIcon: Icon(
                  Iconsax.discount_circle,
                  color: isDark
                      ? VColors.light.withAlpha(128)
                      : VColors.dark.withAlpha(128),
                ),
                hintText: "Enter tax as a percentage (e.g., 15.5)",
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final input = taxController.text.trim();
                      final parsed = double.tryParse(input);

                      if (parsed == null || parsed < 0) {
                        VSnackbar.error(
                          context: context,
                          message:
                              "Please enter a valid positive tax percentage.",
                        );
                        return;
                      }

                      final old = ref.read(appSettingsProvider).value;
                      if (old != null) {
                        final updated = old.copyWith(taxPercentage: parsed);
                        await ref
                            .read(appSettingsProvider.notifier)
                            .updateSettings(updated);
                        VToast.info(
                            message: 'Tax percentage updated and saved');
                      }

                      if (context.mounted) context.pop();
                    },
                    child: const Text('Save'),
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
