import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/features/reports/widgets/sell_section/widgets/most_sold_sheet.dart';
import 'package:invobay/features/reports/widgets/sell_section/widgets/top_customer_sheet.dart';

import '../../../../common/widgets/list_tiles/report_list_tile.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../core/utils/constants/sizes.dart';
import 'widgets/customer_debt_sheet.dart';

class VSellSection extends StatelessWidget {
  const VSellSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VSectionHeading(title: 'Sell', showActionButton: false),
        const SizedBox(height: VSizes.spaceBtwItems),
        VReportListTile(
            title: 'Top Costumers',
            icon: Iconsax.user,
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => const TopCustomersBottomSheet(),
              );
            }),
        VReportListTile(
          title: 'Customer Debts',
          icon: Iconsax.money_remove,
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => const CustomerDebtsBottomSheet(),
            );
          },
        ),
        VReportListTile(
            title: 'Most Sold Items',
            icon: Iconsax.money_send,
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => const MostSoldItemsBottomSheet(),
              );
            }),
      ],
    );
  }
}
