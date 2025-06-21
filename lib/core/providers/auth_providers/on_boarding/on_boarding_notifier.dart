import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce/hive.dart';
import 'package:invobay/core/router/router_constant.dart';

import '../../../controllers/on_boarding_controller.dart';
import '../../../utils/constants/hive_box_strings.dart';

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  final String _boxName = VHive.settingsBox;
  final String _keyName = VHive.onBoardingCompletedKey;

  OnboardingNotifier()
      : super(OnboardingState(
          currentPageIndex: 0,
          pageController: PageController(),
        ));

  void updatePageIndicator(int index) {
    state = state.copyWith(currentPageIndex: index);
  }

  void dotNavigationClick(BuildContext context, int index) {
    state = state.copyWith(currentPageIndex: index);
    state.pageController.jumpToPage(index);
  }

  void nextPage(BuildContext context) async {
    if (state.currentPageIndex == 2) {
      await completeOnboarding();
      if (context.mounted) {
        context.goNamed(VRouter.home);
      }
    } else {
      int page = state.currentPageIndex + 1;
      state.pageController.jumpToPage(page);
      state = state.copyWith(currentPageIndex: page);
    }
  }

  void skipPage(BuildContext context) async {
    await completeOnboarding();
    if (context.mounted) {
      context.goNamed(VRouter.home);
    }
  }

  Future<void> completeOnboarding() async {
    final box = Hive.box(_boxName);
    await box.put(_keyName, true);
  }
}
