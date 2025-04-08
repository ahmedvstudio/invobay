import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';

Widget dismissReturnBackground() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(VSizes.borderRadiusMd),
    child: Container(
      decoration: BoxDecoration(
        color: VColors.info,
        borderRadius: BorderRadius.circular(VSizes.borderRadiusMd),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 300),
        builder: (context, opacity, child) {
          return Opacity(opacity: opacity, child: child);
        },
        child: const Row(
          children: [
            Icon(Iconsax.box_add, color: VColors.white, size: VSizes.iconLg),
            SizedBox(width: VSizes.spaceBtwItems),
            Text('Return to Stock', style: TextStyle(color: VColors.white)),
          ],
        ),
      ),
    ),
  );
}
