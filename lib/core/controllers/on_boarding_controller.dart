import 'package:flutter/material.dart';

class OnboardingState {
  final int currentPageIndex;
  final PageController pageController;

  OnboardingState({
    required this.currentPageIndex,
    required this.pageController,
  });

  OnboardingState copyWith({
    int? currentPageIndex,
    PageController? pageController,
  }) {
    return OnboardingState(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      pageController: pageController ?? this.pageController,
    );
  }
}
