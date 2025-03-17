import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/device/device_utility.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

class VSearchContainer extends StatelessWidget {
  const VSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: VDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(VSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? isDark
                    ? VColors.dark
                    : VColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(
              VSizes.cardRadiusLg,
            ),
            border: showBorder ? Border.all(color: VColors.grey) : null,
          ),
          child: Row(
            children: [
              //
              Icon(icon, color: VColors.darkerGrey),
              const SizedBox(width: VSizes.spaceBtwItems),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
