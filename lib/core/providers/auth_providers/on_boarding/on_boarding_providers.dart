import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/on_boarding_controller.dart';
import 'on_boarding_notifier.dart';

final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>((ref) {
  return OnboardingNotifier();
});
