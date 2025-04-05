import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';

Widget dismissDeleteBackground() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(VSizes.borderRadiusMd),
    child: Container(
      decoration: BoxDecoration(
        color: VColors.error,
        borderRadius: BorderRadius.circular(VSizes.borderRadiusMd),
      ),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 300),
        builder: (context, opacity, child) {
          return Opacity(opacity: opacity, child: child);
        },
        child: const Icon(Iconsax.trash,
            color: VColors.white, size: VSizes.iconLg),
      ),
    ),
  );
}
