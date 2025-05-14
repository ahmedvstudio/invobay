import 'package:flutter/material.dart';

import '../../../common/widgets/list_tiles/report_list_tile.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/utils/constants/sizes.dart';

class VInventorySection extends StatelessWidget {
  const VInventorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VSectionHeading(title: 'Inventory', showActionButton: false),
        const SizedBox(height: VSizes.spaceBtwItems),
        VReportListTile(
          title: 'New Stock Items',
          icon: Icons.new_releases_outlined,
          onTap: () {},
        ),
        VReportListTile(
          title: 'Low Stock Items',
          icon: Icons.low_priority,
          onTap: () {},
        ),
        VReportListTile(
          title: 'Out of Stock Items',
          icon: Icons.outbond_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}
