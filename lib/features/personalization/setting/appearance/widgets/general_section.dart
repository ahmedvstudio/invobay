import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/sheet/settings/currency_picker_sheet.dart';
import '../../../../../common/widgets/sheet/settings/low_stock_threshold_sheet.dart';
import '../../../../../common/widgets/sheet/settings/tax_fee_sheet.dart';
import '../../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../../core/utils/constants/sizes.dart';

class VGeneralSection extends ConsumerWidget {
  const VGeneralSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencySign = ref.watch(currencySignProvider);
    final threshold = ref.watch(lowStockThresholdProvider);
    final currentTax =
        ref.watch(appSettingsProvider).value?.taxPercentage ?? 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('General:'),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        ListTile(
          onTap: () => showCurrencySignBottomSheet(context, ref),
          title: const Text('Currency.'),
          leading: const Icon(Iconsax.dollar_circle),
          trailing: Text(currencySign),
          tileColor: Colors.transparent,
        ),
        ListTile(
          onTap: () => showTaxEditBottomSheet(context, ref),
          title: const Text('Tax Percentage.'),
          leading: const Icon(Iconsax.discount_circle),
          trailing: Text('% $currentTax'),
          tileColor: Colors.transparent,
        ),
        ListTile(
          onTap: () => showLowStockThresholdBottomSheet(context, ref),
          title: const Text('Low Stock Threshold.'),
          leading: const Icon(Iconsax.arrange_circle),
          trailing: Text('$threshold'),
          tileColor: Colors.transparent,
        ),
      ],
    );
  }
}
