import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

class VOrderListItems extends StatelessWidget {
  const VOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return ListView.separated(
      itemCount: 6,
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: VSizes.spaceBtwItems),
      itemBuilder: (_, index) => VRoundedContainer(
        showBorder: true,
        backgroundColor: isDark ? VColors.dark : VColors.light,
        padding: const EdgeInsets.all(VSizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1st Row
            Row(
              children: [
                // icon
                const Icon(Iconsax.ship),
                const SizedBox(width: VSizes.spaceBtwItems / 2),

                // status
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: VColors.primary, fontSizeDelta: 1),
                      ),
                      Text('07 Jan 2025',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.arrow_right_34,
                      size: VSizes.iconSm,
                    ))
              ],
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            // 2nd Row
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: VSizes.spaceBtwItems / 2),

                      // status
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text('[#12345]',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      // icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: VSizes.spaceBtwItems / 2),

                      // status
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shipping Date',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text('03 Feb 2025',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
