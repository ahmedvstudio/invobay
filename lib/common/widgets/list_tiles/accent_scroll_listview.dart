import 'package:flutter/material.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../custom_shapes/containers/rounded_container.dart';

class VAccentScroll extends StatelessWidget {
  const VAccentScroll({
    super.key,
    required this.isSelected,
    required this.backgroundColor,
    this.onTap,
  });

  final bool isSelected;
  final Color backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return InkWell(
      borderRadius: BorderRadius.circular(VSizes.cardRadiusLg),
      onTap: onTap,
      child: SizedBox(
        width: 100,
        child: Stack(
          children: [
            const VRoundedContainer(
              backgroundColor: Colors.transparent,
              showBorder: true,
              borderColor: VColors.darkGrey,
            ),
            Positioned(
              top: 5,
              left: 5,
              child: VRoundedContainer(
                backgroundColor: backgroundColor,
                width: 65,
                height: 90,
              ),
            ),
            Positioned(
              top: 8,
              right: 7,
              child: VRoundedContainer(
                backgroundColor: isDark ? VColors.darkerGrey : VColors.grey,
                showBorder: true,
                borderColor: VColors.darkGrey,
                width: 20,
                height: 20,
                child: isSelected
                    ? const Icon(Icons.check_circle,
                        color: Colors.green, size: 18)
                    : null,
              ),
            ),
            const Positioned(
              bottom: 10,
              right: 10,
              child: VRoundedContainer(
                backgroundColor: VColors.error,
                width: 50,
                height: 10,
              ),
            ),
            const Positioned(
              bottom: 10,
              left: 5,
              child: VRoundedContainer(
                backgroundColor: VColors.warning,
                width: 30,
                height: 10,
              ),
            ),
            const Positioned(
              bottom: 30,
              right: 10,
              child: VRoundedContainer(
                backgroundColor: VColors.success,
                width: 30,
                height: 10,
              ),
            ),
            const Positioned(
              bottom: 30,
              left: 5,
              child: VRoundedContainer(
                backgroundColor: VColors.info,
                width: 50,
                height: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
