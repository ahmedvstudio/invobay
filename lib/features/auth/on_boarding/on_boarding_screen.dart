import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import '../../../core/providers/auth_providers/on_boarding/on_boarding_providers.dart';
import '../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import 'widgets/on_boarding_button.dart';
import 'widgets/on_boarding_dots.dart';
import 'widgets/on_boarding_page.dart';
import 'widgets/on_boarding_skip.dart';

import '../../../core/utils/constants/image_strings.dart';
import '../../../core/utils/constants/text_strings.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboarding = ref.watch(onboardingProvider);
    final notifier = ref.read(onboardingProvider.notifier);
    final locale = ref.watch(localeProvider);
    final isEnglish = VHelperFunctions.isEnglish(locale);
    return Scaffold(
      body: Stack(
        children: [
          // Pages
          PageView(
            controller: onboarding.pageController,
            onPageChanged: notifier.updatePageIndicator,
            children: const [
              OnboardingPage(
                image: VImages.onBoarding1,
                title: VText.gettingStartedTitle1,
                subTitle: VText.gettingStartedSubTitle1,
              ),
              OnboardingPage(
                image: VImages.onBoarding2,
                title: VText.gettingStartedTitle2,
                subTitle: VText.gettingStartedSubTitle2,
              ),
              OnboardingPage(
                image: VImages.onBoarding3,
                title: VText.gettingStartedTitle3,
                subTitle: VText.gettingStartedSubTitle3,
              ),
            ],
          ),

          // skip button
          OnboardingSkip(isEnglish),

          // dots
          OnboardingDots(isEnglish),

          // Circular button
          OnboardingButton(isEnglish),
        ],
      ),
    );
  }
}
