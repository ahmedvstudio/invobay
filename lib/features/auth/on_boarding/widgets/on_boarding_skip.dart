import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/auth_providers/on_boarding/on_boarding_providers.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/device/device_utility.dart';

class OnboardingSkip extends ConsumerWidget {
  const OnboardingSkip(
    this.isEnglish, {
    super.key,
  });
  final bool isEnglish;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(onboardingProvider.notifier);
    return Positioned(
        top: VDeviceUtils.getAppBarHeight(),
        right: isEnglish ? VSizes.defaultSpace : null,
        left: isEnglish ? null : VSizes.defaultSpace,
        child: TextButton(
          onPressed: () => notifier.skipPage(context),
          child: const Text('Skip'),
        ));
  }
}
