import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/styles/spacing_style.dart';

import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

class VReceiptCardList extends StatelessWidget {
  final List<Map<String, String>> items;
  final void Function(String) onTap;
  final bool isEditMode;
  final Set<String> selectedItems;
  final VoidCallback? onLongPressed;

  const VReceiptCardList({
    super.key,
    required this.items,
    required this.onTap,
    this.isEditMode = false,
    this.selectedItems = const {},
    this.onLongPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);

    return ListView.separated(
      padding: VSpacingStyle.withoutTop,
      itemCount: items.length,
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: VSizes.spaceBtwItems),
      itemBuilder: (_, index) {
        final item = items[index];
        final isSelected = selectedItems.contains(item['id']);

        return GestureDetector(
          onTap: () => onTap(item['id'] ?? ''),
          onLongPress: onLongPressed,
          child: VRoundedContainer(
            showBorder: true,
            backgroundColor: isDark ? VColors.dark : VColors.light,
            padding: const EdgeInsets.all(VSizes.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    if (isEditMode)
                      Checkbox(
                        value: isSelected,
                        onChanged: (_) => onTap(item['id'] ?? ''),
                      ),
                    if (!isEditMode)
                      IconButton(
                        onPressed: () => onTap(item['id'] ?? ''),
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: VSizes.iconSm,
                        ),
                      ),
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
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  item['receiptId'] ?? '[####]',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
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
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  item['total'] ?? '####',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
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
          ),
        );
      },
    );
  }
}
