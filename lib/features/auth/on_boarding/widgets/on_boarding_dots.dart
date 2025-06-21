import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/providers/auth_providers/on_boarding/on_boarding_providers.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/device/device_utility.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

class OnboardingDots extends ConsumerWidget {
  const OnboardingDots(
    this.isEnglish, {
    super.key,
  });
  final bool isEnglish;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = VHelperFunctions.isDarkMode(context);
    final onboarding = ref.watch(onboardingProvider);
    final notifier = ref.read(onboardingProvider.notifier);
    return Positioned(
      bottom: VDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: isEnglish ? VSizes.defaultSpace : null,
      right: isEnglish ? null : VSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: onboarding.pageController,
        onDotClicked: (index) => notifier.dotNavigationClick(context, index),
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: isDark ? VColors.light : VColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}
