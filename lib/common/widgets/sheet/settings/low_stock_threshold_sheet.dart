import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/extensions/app_setting_extension.dart';

import '../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../../../../core/utils/messages/snackbar.dart';
import '../../../../core/utils/messages/toast.dart';
import '../../../styles/spacing_style.dart';

Future<void> showLowStockThresholdBottomSheet(
    BuildContext context, WidgetRef ref) async {
  final currentThreshold =
      ref.read(appSettingsProvider).value?.lowStockThreshold ?? 5;
  final thresholdController =
      TextEditingController(text: currentThreshold.toString());
  final isDark = VHelperFunctions.isDarkMode(context);

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
              'Low Stock Warning',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            TextFormField(
              maxLength: 3,
              controller: thresholdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Threshold Value",
                prefixIcon: Icon(
                  Iconsax.arrange_circle,
                  color: isDark
                      ? VColors.light.withAlpha(128)
                      : VColors.dark.withAlpha(128),
                ),
                hintText: "warning when stock ≤ threshold",
                counterText: "",
              ),
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: VSizes.spaceBtwItems),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final input = thresholdController.text.trim();
                      final parsed = int.tryParse(input);

                      if (parsed == null || parsed < 0) {
                        VSnackbar.error(
                          context: context,
                          message: "Enter a valid positive number.",
                        );
                        return;
                      }

                      final old = ref.read(appSettingsProvider).value;
                      if (old != null) {
                        final updated = old.copyWith(lowStockThreshold: parsed);
                        await ref
                            .read(appSettingsProvider.notifier)
                            .updateSettings(updated);
                        VToast.info(
                            message: 'Low stock threshold updated and saved');
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
