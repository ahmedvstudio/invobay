import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/features/reports/widgets/return_section/widgets/most_returned_sheet.dart';

import '../../../../common/widgets/list_tiles/report_list_tile.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../core/utils/constants/sizes.dart';

class VReturnsSection extends StatelessWidget {
  const VReturnsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSectionHeading(title: context.loc.returns, showActionButton: false),
        const SizedBox(height: VSizes.spaceBtwItems),
        VReportListTile(
          title: context.loc.mostReturnedItems,
          icon: Iconsax.info_circle,
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => const MostReturnedItemsBottomSheet(),
            );
          },
        ),
      ],
    );
  }
}
