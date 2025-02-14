import 'package:flutter/material.dart';
import 'package:invobay/features/controllers/getting_started_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class GettingStartedDots extends StatelessWidget {
  const GettingStartedDots({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    final controller = GettingStartedController.instance;
    return Positioned(
        bottom: VDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: VSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: isDark ? VColors.light : VColors.dark,
              dotHeight: 6),
        ));
  }
}
