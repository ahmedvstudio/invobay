import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/extensions/app_setting_extension.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import '../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';

Future<void> showTaxEditDialog(BuildContext context, WidgetRef ref) async {
  final currentTax = ref.read(appSettingsProvider).value?.taxPercentage ?? 0.0;
  final isDark = VHelperFunctions.isDarkMode(context);
  final taxController = TextEditingController(text: currentTax.toString());

  await VHelperFunctions.showCustomDialog(
    context: context,
    title: 'Edit Tax Percentage',
    content: TextFormField(
      controller: taxController,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      decoration: InputDecoration(
        labelText: "Tax %",
        prefixIcon: Icon(
          Iconsax.discount_circle,
          color: isDark
              ? VColors.light.withValues(alpha: 0.5)
              : VColors.dark.withValues(alpha: 0.5),
        ),
        hintText: "Enter tax as a percentage (e.g., 15.5)",
      ),
    ),
    onSaved: () async {
      final input = taxController.text.trim();
      final parsed = double.tryParse(input);

      if (parsed == null || parsed < 0) {
        VHelperFunctions.showSnackBar(
          context: context,
          message: "Please enter a valid positive tax percentage.",
        );
        return;
      }

      final old = ref.read(appSettingsProvider).value;
      if (old != null) {
        final updated = old.copyWith(taxPercentage: parsed);

        await ref.read(appSettingsProvider.notifier).updateSettings(updated);

        VHelperFunctions.showToasty(
          message: 'Tax percentage updated and saved',
          backgroundColor: VColors.info,
        );
      }

      if (!context.mounted) return;
      context.pop();
    },
  );
}
