import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/text/item_title_text_with_icon.dart';
import '../../../../core/utils/constants/sizes.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
              child: VItemTitleTextWithIcon(
                title: 'Sales',
                icon: Iconsax.tag5,
              ),
            ),
            Expanded(
              child: VItemTitleTextWithIcon(
                title: 'Purchases',
                icon: Iconsax.shopping_cart5,
              ),
            ),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        const Row(
          children: [
            Expanded(
                child: VItemTitleTextWithIcon(
              title: 'Returns',
              icon: Iconsax.shopping_bag5,
            )),
            Expanded(
                child: VItemTitleTextWithIcon(
              title: 'Receipts',
              icon: Iconsax.receipt_2_15,
            )),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        const Row(
          children: [
            Expanded(
                child: VItemTitleTextWithIcon(
              title: 'Reports',
              icon: Iconsax.receipt_item5,
            )),
            Expanded(
                child: VItemTitleTextWithIcon(
              title: 'and More..',
              icon: Iconsax.more,
            )),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwSections),
        Text(
          'Stay organized and in control with a secure vault and much more—all in one app.',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
