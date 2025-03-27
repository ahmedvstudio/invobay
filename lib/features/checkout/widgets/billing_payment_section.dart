import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/image_strings.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';

class VBillingPaymentSection extends StatelessWidget {
  const VBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        VSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        Row(
          children: [
            VRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: isDark ? VColors.light : VColors.white,
              padding: const EdgeInsets.all(VSizes.xs),
              child: SvgPicture.asset(VImages.cashSVG, fit: BoxFit.contain),
            ),
            const SizedBox(width: VSizes.spaceBtwItems / 2),
            Text(
              'Cash',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}
