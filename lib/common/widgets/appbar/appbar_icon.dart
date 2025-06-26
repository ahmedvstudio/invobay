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
    this.isLTR = true,
  });
  final VoidCallback? onPressed;
  final IconData icon;
  final bool badge;
  final String badgeText;
  final bool isLTR;
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
        if (badge && badgeText.isNotEmpty && badgeText != '0')
          Positioned(
            right: isLTR ? 0 : null,
            left: isLTR ? null : 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: VColors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  badgeText,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: VColors.black, fontSizeFactor: 0.8),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
