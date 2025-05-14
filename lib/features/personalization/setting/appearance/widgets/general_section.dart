import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/dialogs/currency_sign_dialog.dart';
import '../../../../../common/widgets/dialogs/edit_tax_dialog.dart';
import '../../../../../common/widgets/dialogs/low_stock_threshold_dialog.dart';
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
          onTap: () => showCurrencySignDialog(context, ref),
          title: const Text('Currency Sign.'),
          leading: const Icon(Iconsax.dollar_circle),
          trailing: Text(currencySign),
          tileColor: Colors.transparent,
        ),
        ListTile(
          onTap: () => showTaxEditDialog(context, ref),
          title: const Text('Tax Percentage.'),
          leading: const Icon(Iconsax.discount_circle),
          trailing: Text('% $currentTax'),
          tileColor: Colors.transparent,
        ),
        ListTile(
          onTap: () => showLowStockThresholdDialog(context, ref),
          title: const Text('Low Stock Threshold.'),
          leading: const Icon(Iconsax.arrange_circle),
          trailing: Text('$threshold'),
          tileColor: Colors.transparent,
        ),
      ],
    );
  }
}
