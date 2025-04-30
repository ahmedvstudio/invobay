import 'package:flutter/material.dart';
import 'package:invobay/core/utils/constants/sizes.dart';

import '../../../core/utils/constants/colors.dart';

class VHomeButton extends StatelessWidget {
  const VHomeButton({
    super.key,
    this.width = 100,
    this.height = 100,
    this.radius = 24,
    this.labelHeight = 30,
    this.iconSize = 50,
    this.child,
    this.onPressed,
    this.bgColor = VColors.primary,
    this.labelBgColor = VColors.onPrimary,
    this.borderColor = VColors.darkerGrey,
    this.iconColor = VColors.white,
    this.shadowColor = VColors.black,
    this.textColor = VColors.white,
    required this.icon,
    required this.title,
  });
  final double width;
  final double height;
  final double radius;
  final double labelHeight;
  final double iconSize;
  final Widget? child;
  final VoidCallback? onPressed;
  final Color bgColor;
  final Color labelBgColor;
  final Color borderColor;
  final Color shadowColor;
  final IconData icon;
  final Color iconColor;
  final Color textColor;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: bgColor,
              side: BorderSide(color: borderColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Icon(
                    icon,
                    size: iconSize,
                    color: iconColor,
                    shadows: [
                      Shadow(
                          color: shadowColor,
                          blurRadius: 10,
                          offset: const Offset(0, 3)),
                    ],
                  ),
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: width,
            height: labelHeight,
            decoration: BoxDecoration(
              color: labelBgColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius)),
              border: Border.all(color: borderColor),
            ),
            child: Center(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: VColors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
