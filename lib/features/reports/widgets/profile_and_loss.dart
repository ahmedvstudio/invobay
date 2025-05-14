import 'package:flutter/material.dart';

import '../../../common/widgets/text/key_value_text.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/utils/constants/sizes.dart';

class VProfitAndLoss extends StatelessWidget {
  const VProfitAndLoss({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        VSectionHeading(
            title: 'Profit & Loss Statement', showActionButton: false),
        SizedBox(height: VSizes.spaceBtwItems),
        VKeyValueText("Gross Revenue", "₹45,000"),
        VKeyValueText("COGS", "₹32,000"),
        VKeyValueText("Return Loss", "₹3,000"),
        VKeyValueText("Profit Margin", "22% / ₹10,000"),
      ],
    );
  }
}
