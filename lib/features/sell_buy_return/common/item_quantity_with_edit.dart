import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/utils/constants/sizes.dart';

class VItemQuantityWithEdit extends StatelessWidget {
  const VItemQuantityWithEdit({
    super.key,
    required this.quantity,
    required this.buyingPrice,
    required this.currencySign,
  });
  final double quantity;
  final double buyingPrice;
  final String currencySign;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Iconsax.edit5, size: VSizes.iconSd),
        const SizedBox(width: VSizes.spaceBtwItems),
        Text(
          '$quantity',
          style: Theme.of(context).textTheme.titleMedium,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(width: VSizes.xs),
        Text(
          '× $currencySign$buyingPrice',
          style: Theme.of(context).textTheme.labelMedium,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
