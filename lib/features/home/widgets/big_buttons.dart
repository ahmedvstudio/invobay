import 'package:flutter/material.dart';

import '../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/helpers/helper_functions.dart';

class VBigButton extends StatelessWidget {
  const VBigButton({
    super.key,
    this.onTap,
    required this.icon,
    required this.text,
    this.width = 100,
    this.height = 100,
  });
  final VoidCallback? onTap;
  final double width, height;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: VCircularContainer(
        backgroundColor: isDark ? VColors.dark : VColors.light,
        width: width,
        height: height,
        radius: 25,
        child: Column(
          spacing: 6,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: height * 0.6,
                color: isDark ? VColors.secondaryDark : VColors.secondary),
            Text(
              text,
              style: Theme.of(context).textTheme.titleLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
