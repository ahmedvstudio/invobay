import 'package:flutter/material.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

import '../../../core/utils/constants/sizes.dart';

class VRoundedButton extends StatelessWidget {
  const VRoundedButton({
    super.key,
    required this.title,
    this.onTap,
    this.onLongPress,
    required this.icon,
    this.iconColor = VColors.info,
    this.width = 100,
  });
  final String title;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final IconData icon;
  final Color iconColor;
  final double width;
  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return InkWell(
      borderRadius: BorderRadius.circular(VSizes.borderRadiusXl),
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        height: 100,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            color: isDark
                ? VColors.light.withValues(alpha: 0.5)
                : VColors.dark.withValues(alpha: 0.5),
          ),
          borderRadius: BorderRadius.circular(VSizes.borderRadiusXl),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: VSizes.sm, right: VSizes.sm, top: VSizes.xs),
                    child: Icon(icon, size: 60, color: iconColor),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: VSizes.sm, left: VSizes.sm, bottom: VSizes.xs),
                    child: Text(title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
