import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/icons/circular_icon.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';

class VItemQuantityWithAddRemove extends StatelessWidget {
  const VItemQuantityWithAddRemove({
    super.key,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
    required this.onQuantityTap,
    this.isPressed = false,
  });
  final double quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onQuantityTap;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        VCircularIcon(
          onPressed: onRemove,
          icon: isPressed ? Iconsax.trash : Iconsax.minus,
          width: 32,
          height: 32,
          size: VSizes.md,
          color: isPressed
              ? VColors.white
              : isDark
                  ? VColors.white
                  : VColors.black,
          backgroundColor: isPressed
              ? VColors.error
              : isDark
                  ? VColors.darkerGrey
                  : VColors.light,
        ),
        const SizedBox(width: VSizes.spaceBtwItems),
        GestureDetector(
          onTap: onQuantityTap,
          child: Text(quantity.toString(),
              style: Theme.of(context).textTheme.titleMedium),
        ),
        const SizedBox(width: VSizes.spaceBtwItems),
        VCircularIcon(
          onPressed: onAdd,
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: VSizes.md,
          color: VColors.white,
          backgroundColor: VColors.primary,
        ),
      ],
    );
  }
}
