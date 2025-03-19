import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/helpers/helper_functions.dart';

class VAppBarIcon extends StatelessWidget {
  const VAppBarIcon({
    super.key,
    this.onPressed,
    this.icon = Iconsax.notification,
    this.badge = true,
    this.badgeText = '2',
  });
  final VoidCallback? onPressed;
  final IconData icon;
  final bool badge;
  final String badgeText;

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: isDark ? VColors.white : VColors.white,
          ),
        ),
        if (badge)
          Positioned(
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: isDark ? VColors.white : VColors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  badgeText,
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: isDark ? VColors.black : VColors.black,
                      fontSizeFactor: 0.8),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
