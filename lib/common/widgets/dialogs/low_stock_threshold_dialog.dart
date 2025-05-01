import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/extensions/app_setting_extension.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import 'package:invobay/core/utils/messages/snackbar.dart';
import 'package:invobay/core/utils/messages/toast.dart';
import '../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';

Future<void> showLowStockThresholdDialog(
    BuildContext context, WidgetRef ref) async {
  final currentThreshold =
      ref.read(appSettingsProvider).value?.lowStockThreshold ?? 5;
  final thresholdController =
      TextEditingController(text: currentThreshold.toString());
  final isDark = VHelperFunctions.isDarkMode(context);

  await VHelperFunctions.showCustomDialog(
    context: context,
    title: 'Low Stock Warning',
    content: TextFormField(
      maxLength: 3,
      controller: thresholdController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Threshold Value",
        prefixIcon: Icon(
          Iconsax.arrange_circle,
          color: isDark
              ? VColors.light.withValues(alpha: 0.5)
              : VColors.dark.withValues(alpha: 0.5),
        ),
        hintText: "E.g., 3 (Show warning when stock <= 3)",
        counterText: "",
      ),
    ),
    onSaved: () async {
      final input = thresholdController.text.trim();
      final parsed = int.tryParse(input);

      if (parsed == null || parsed < 0) {
        VSnackbar.error(
            context: context, message: "Enter a valid positive number.");

        return;
      }

      final old = ref.read(appSettingsProvider).value;
      if (old != null) {
        final updated = old.copyWith(lowStockThreshold: parsed);

        await ref.read(appSettingsProvider.notifier).updateSettings(updated);
        VToast.info(message: 'Low stock threshold updated and saved');
      }

      if (!context.mounted) return;
      context.pop();
    },
  );
}
