import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/list_tiles/report_list_tile.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/utils/constants/sizes.dart';

class VBuySection extends StatelessWidget {
  const VBuySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VSectionHeading(title: 'Buy', showActionButton: false),
        const SizedBox(height: VSizes.spaceBtwItems),
        VReportListTile(
          title: 'Top suppliers',
          icon: Iconsax.user_tag,
          onTap: () {},
        ),
        VReportListTile(
          title: 'Debt to the Supplier',
          icon: Iconsax.money_change,
          onTap: () {},
        ),
        VReportListTile(
          title: 'Most Bought Items',
          icon: Iconsax.money_recive,
          onTap: () {},
        ),
        VReportListTile(
          title: 'Average cost per item',
          icon: Iconsax.align_vertically,
          onTap: () {},
        ),
      ],
    );
  }
}
