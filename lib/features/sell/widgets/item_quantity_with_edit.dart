import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/utils/constants/sizes.dart';

class VItemQuantityWithEdit extends StatelessWidget {
  const VItemQuantityWithEdit({
    super.key,
    required this.quantity,
  });
  final double quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Iconsax.edit5, size: VSizes.iconSd),
        const SizedBox(width: VSizes.spaceBtwItems),
        Text(quantity.toString(),
            style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
