import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/item_cards/summary_card.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/providers/report_providers/report_related_providers.dart';
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

    return Column(
      children: [
        const VSectionHeading(title: 'Summary', showActionButton: false),
        const SizedBox(height: VSizes.spaceBtwItems * 1.5),
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
                title: 'Purchases',
                amount: totalBuy,
                icon: Iconsax.truck,
                color: Colors.lightGreen),
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
