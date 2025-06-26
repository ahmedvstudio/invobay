import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

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
        Row(
          children: [
            Expanded(
              child: VItemTitleTextWithIcon(
                title: context.loc.sell,
                icon: Iconsax.tag5,
              ),
            ),
            Expanded(
              child: VItemTitleTextWithIcon(
                title: context.loc.buy,
                icon: Iconsax.shopping_cart5,
              ),
            ),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        Row(
          children: [
            Expanded(
                child: VItemTitleTextWithIcon(
              title: context.loc.returns,
              icon: Iconsax.shopping_bag5,
            )),
            Expanded(
                child: VItemTitleTextWithIcon(
              title: context.loc.receipts,
              icon: Iconsax.receipt_2_15,
            )),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        Row(
          children: [
            Expanded(
                child: VItemTitleTextWithIcon(
              title: context.loc.reports,
              icon: Iconsax.receipt_item5,
            )),
            Expanded(
                child: VItemTitleTextWithIcon(
              title: context.loc.more,
              icon: Iconsax.more,
            )),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwSections),
        Text(
          context.loc.onBoardingFooterText,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
