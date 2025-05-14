import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/item_cards/summary_card.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

class VSummaryCards extends StatelessWidget {
  const VSummaryCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        VSectionHeading(title: 'Summary', showActionButton: false),
        SizedBox(height: VSizes.spaceBtwItems * 1.5),
        Row(
          spacing: VSizes.spaceBtwItems,
          children: [
            VSummaryCard(
                title: 'Inventory Value',
                amount: 0.00,
                icon: Iconsax.archive,
                color: Colors.amber),
          ],
        ),
        SizedBox(height: VSizes.spaceBtwItems),
        Row(
          spacing: VSizes.spaceBtwItems,
          children: [
            VSummaryCard(
                title: 'Sales',
                amount: 0.00,
                icon: Iconsax.trend_up,
                color: VColors.success),
            VSummaryCard(
                title: 'Purchases',
                amount: 0.00,
                icon: Iconsax.truck,
                color: VColors.info),
          ],
        ),
        SizedBox(height: VSizes.spaceBtwItems),
        Row(
          spacing: VSizes.spaceBtwItems,
          children: [
            VSummaryCard(
                title: 'Returns',
                amount: 0.00,
                icon: Iconsax.undo,
                color: VColors.warning),
            VSummaryCard(
                title: 'Profit / Loss',
                amount: 0.00,
                icon: Iconsax.money,
                color: Colors.purple),
          ],
        ),
      ],
    );
  }
}
