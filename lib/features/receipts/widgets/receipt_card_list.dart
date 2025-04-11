import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

class VReceiptCardList extends StatelessWidget {
  final List<Map<String, String>> items;
  final void Function(String) onTap;

  const VReceiptCardList({
    super.key,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return ListView.separated(
      padding: const EdgeInsets.only(
          right: VSizes.defaultSpace,
          left: VSizes.defaultSpace,
          bottom: VSizes.defaultSpace),
      itemCount: items.length,
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: VSizes.spaceBtwItems),
      itemBuilder: (_, index) {
        final item = items[index];
        return VRoundedContainer(
          showBorder: true,
          backgroundColor: isDark ? VColors.dark : VColors.light,
          padding: const EdgeInsets.all(VSizes.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Icon(Iconsax.calendar),
                  const SizedBox(width: VSizes.spaceBtwItems / 2),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['paymentStatus'] ?? 'Unknown',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: item['paymentStatus'] == 'Completed'
                                    ? VColors.success
                                    : VColors.error,
                                fontSizeDelta: 1,
                              ),
                        ),
                        Text(
                          item['date'] ?? '## ### ####',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => onTap(item['id'] ?? ''),
                    icon: const Icon(
                      Iconsax.arrow_right_34,
                      size: VSizes.iconSm,
                    ),
                  )
                ],
              ),
              const SizedBox(height: VSizes.spaceBtwItems),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Iconsax.tag),
                        const SizedBox(width: VSizes.spaceBtwItems / 2),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Receipt No.',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Text(
                                item['receiptId'] ?? '[####]',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Iconsax.dollar_square),
                        const SizedBox(width: VSizes.spaceBtwItems / 2),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Text(
                                item['total'] ?? '####',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
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
        );
      },
    );
  }
}
