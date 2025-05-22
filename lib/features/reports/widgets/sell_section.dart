import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/dialogs/customers_debt_dialog.dart';
import '../../../common/widgets/dialogs/most_sold_item_dialog.dart';
import '../../../common/widgets/dialogs/top_customers_dialog.dart';
import '../../../common/widgets/list_tiles/report_list_tile.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/utils/constants/sizes.dart';

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
              showDialog(
                context: context,
                builder: (_) => const TopCustomersDialog(),
              );
            }),
        VReportListTile(
          title: 'Customer Debts',
          icon: Iconsax.money_remove,
          onTap: () {
            showDialog(
                context: context, builder: (_) => const CustomerDebtsDialog());
          },
        ),
        VReportListTile(
          title: 'Most Sold Items',
          icon: Iconsax.money_send,
          onTap: () {
            showDialog(
                context: context, builder: (_) => const MostSoldItemsDialog());
          },
        ),
      ],
    );
  }
}
