import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/extensions/app_setting_extension.dart';
import 'package:invobay/core/utils/messages/toast.dart';
import '../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/helpers/helper_functions.dart';

Future<void> showCurrencySignDialog(BuildContext context, WidgetRef ref) async {
  final currentCurrency = ref.read(currencySignProvider);
  final currencyController = TextEditingController(text: currentCurrency);
  final isDark = VHelperFunctions.isDarkMode(context);

  await VHelperFunctions.showCustomDialog(
    context: context,
    title: 'Edit Currency Sign',
    content: TextFormField(
      maxLength: 5,
      controller: currencyController,
      decoration: InputDecoration(
        labelText: "Currency Sign",
        counterText: '',
        prefixIcon: Icon(
          Iconsax.dollar_circle,
          color: isDark
              ? VColors.light.withValues(alpha: 0.5)
              : VColors.dark.withValues(alpha: 0.5),
        ),
      ),
    ),
    onSaved: () async {
      final newCurrency = currencyController.text.trim();

      if (newCurrency.isEmpty) return;

      final old = ref.read(appSettingsProvider).value;

      if (old != null) {
        final updated = old.copyWith(currencySign: newCurrency);

        await ref.read(appSettingsProvider.notifier).updateSettings(updated);
        VToast.info(message: 'Currency sign updated and saved');
      }

      if (!context.mounted) return;
      context.pop();
    },
  );
}
