import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/providers/currency_sign.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

class VItemPriceTextWithIcon extends ConsumerWidget {
  const VItemPriceTextWithIcon({
    super.key,
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
    this.iconColor = VColors.kPrimary,
  });

  final String price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;
  final Color iconColor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencySign = ref.watch(currencySignProvider);

    return Row(
      children: [
        Icon(Iconsax.tag, color: iconColor, size: VSizes.iconSm),
        const SizedBox(width: VSizes.xs),
        Text(
          '$currencySign $price',
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: isLarge
              ? Theme.of(context).textTheme.titleLarge!.apply(
                  decoration: lineThrough ? TextDecoration.lineThrough : null)
              : Theme.of(context).textTheme.bodyLarge!.apply(
                  decoration: lineThrough ? TextDecoration.lineThrough : null),
        ),
      ],
    );
  }
}
