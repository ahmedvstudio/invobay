import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

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
        Text('${context.loc.general}:'),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        ListTile(
          onTap: () => showCurrencySignBottomSheet(context, ref),
          title: Text(context.loc.currency),
          leading: const Icon(Iconsax.dollar_circle),
          trailing: Text(currencySign),
          tileColor: Colors.transparent,
        ),
        ListTile(
          onTap: () => showTaxEditBottomSheet(context, ref),
          title: Text(context.loc.taxPercentage),
          leading: const Icon(Iconsax.discount_circle),
          trailing: Text('% $currentTax'),
          tileColor: Colors.transparent,
        ),
        ListTile(
          onTap: () => showLowStockThresholdBottomSheet(context, ref),
          title: Text(context.loc.lowStockThreshold),
          leading: const Icon(Iconsax.arrange_circle),
          trailing: Text('$threshold'),
          tileColor: Colors.transparent,
        ),
      ],
    );
  }
}
