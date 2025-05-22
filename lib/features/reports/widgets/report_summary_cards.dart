import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/item_cards/summary_card.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../core/providers/report_providers/report_related_providers.dart';
import '../../../core/services/printing/reports/summary_print/summary_print.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

class VSummaryCards extends ConsumerWidget {
  const VSummaryCards({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventoryValue = ref.watch(inventoryValueProvider);
    final totalSales = ref.watch(totalSaleProvider);
    final totalBuy = ref.watch(totalBuyProvider);
    final totalReturn = ref.watch(totalReturnProvider);
    final profitStats = ref.watch(profitStatsProvider);
    final currencySign = ref.watch(currencySignProvider);

    return Column(
      children: [
        VSectionHeading(
          title: 'Summary',
          buttonTitle: 'Print',
          onPressed: () => summaryPrint(
            context,
            inventoryValue: inventoryValue,
            totalSales: totalSales,
            totalBuy: totalBuy,
            totalReturn: totalReturn,
            profit: profitStats.profit,
            currencySign: currencySign,
          ),
        ),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        Row(
          spacing: VSizes.spaceBtwItems,
          children: [
            VSummaryCard(
                title: 'Inventory Value',
                amount: inventoryValue,
                icon: Iconsax.archive,
                color: VColors.warning),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        Row(
          spacing: VSizes.spaceBtwItems,
          children: [
            VSummaryCard(
                title: 'Sales',
                amount: totalSales,
                icon: Iconsax.trend_up,
                color: VColors.info),
            VSummaryCard(
                title: 'Buy',
                amount: totalBuy,
                icon: Iconsax.truck,
                color: Colors.pink),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        Row(
          spacing: VSizes.spaceBtwItems,
          children: [
            VSummaryCard(
                title: 'Returns',
                amount: totalReturn,
                icon: Iconsax.undo,
                color: Colors.purple),
            VSummaryCard(
              title: 'Profit / Loss',
              amount: profitStats.profit,
              icon: Iconsax.money,
              color: profitStats.profit > 0 ? VColors.success : VColors.error,
            ),
          ],
        ),
      ],
    );
  }
}
