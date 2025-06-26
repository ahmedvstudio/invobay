import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

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
    final receiptsBalance = ref.watch(receiptsBalanceProvider);
    final expenseBalance = ref.watch(expenseBalanceProvider);

    return Column(
      children: [
        const SizedBox(height: VSizes.spaceBtwItems),
        VSectionHeading(title: context.loc.summary, showActionButton: false),
        const SizedBox(height: VSizes.spaceBtwItems),
        Row(
          spacing: VSizes.spaceBtwItems,
          children: [
            Expanded(
              child: VSummaryCard(
                  title: context.loc.vaultBalance,
                  amount: receiptsBalance,
                  icon: Iconsax.archive,
                  color: Colors.teal),
            ),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        Row(
          spacing: VSizes.spaceBtwItems,
          children: [
            Expanded(
              child: VSummaryCard(
                  title: context.loc.inventoryValue,
                  amount: inventoryValue,
                  icon: Iconsax.archive,
                  color: VColors.warning),
            ),
            Expanded(
              child: VSummaryCard(
                  title: context.loc.sales,
                  amount: totalSales,
                  icon: Iconsax.trend_up,
                  color: VColors.info),
            ),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        Row(
          spacing: VSizes.spaceBtwItems,
          children: [
            Expanded(
              child: VSummaryCard(
                  title: context.loc.buy,
                  amount: totalBuy,
                  icon: Iconsax.truck,
                  color: Colors.pink),
            ),
            Expanded(
              child: VSummaryCard(
                  title: context.loc.returns,
                  amount: totalReturn,
                  icon: Iconsax.undo,
                  color: Colors.purple),
            ),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        Row(
          spacing: VSizes.spaceBtwItems,
          children: [
            Expanded(
              child: VSummaryCard(
                  title: context.loc.expenses,
                  amount: expenseBalance,
                  icon: Iconsax.money_send,
                  color: VColors.darkGrey),
            ),
            Expanded(
              child: VSummaryCard(
                title: context.loc.profitLoss,
                amount: profitStats.profit,
                icon: Iconsax.money,
                color: profitStats.profit > 0 ? VColors.success : VColors.error,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
