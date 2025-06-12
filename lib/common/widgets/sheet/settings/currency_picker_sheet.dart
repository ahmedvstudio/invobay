import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/device/device_utility.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import 'package:invobay/core/utils/messages/toast.dart';

import '../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';

Future<void> showCurrencySignBottomSheet(
    BuildContext context, WidgetRef ref) async {
  final isDark = VHelperFunctions.isDarkMode(context);
  final currentCurrencySymbol = ref.read(currencySignProvider);

  showCurrencyPicker(
    context: context,
    theme: CurrencyPickerThemeData(
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
      subtitleTextStyle: Theme.of(context).textTheme.labelMedium,
      currencySignTextStyle: Theme.of(context).textTheme.labelSmall,
      flagSize: VSizes.lg,
      bottomSheetHeight: VDeviceUtils.getScreenHeight(context) * 0.6,
      inputDecoration: InputDecoration(
        hintText: 'Search',
        hintStyle: Theme.of(context).textTheme.bodySmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(VSizes.cardRadiusLg),
        ),
        prefixIcon:
            const Icon(Iconsax.search_normal, color: VColors.darkerGrey),
        filled: true,
        fillColor: isDark ? VColors.dark : VColors.light,
      ),
    ),
    showFlag: true,
    showCurrencyName: true,
    showCurrencyCode: true,
    onSelect: (Currency currency) async {
      final symbol = currency.symbol;
      final old = ref.read(appSettingsProvider).value;

      if (old != null && symbol != currentCurrencySymbol) {
        final updated = old.copyWith(currencySign: symbol);
        await ref.read(appSettingsProvider.notifier).updateSettings(updated);
        VToast.success(
            message: 'Currency updated to ${currency.name} ($symbol)');
      }
    },
  );
}
