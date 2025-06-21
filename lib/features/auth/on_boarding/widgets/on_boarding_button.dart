import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/auth_providers/on_boarding/on_boarding_providers.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/device/device_utility.dart';

class OnboardingButton extends ConsumerWidget {
  const OnboardingButton(
    this.isEnglish, {
    super.key,
  });
  final bool isEnglish;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(onboardingProvider.notifier);

    return Positioned(
      left: isEnglish ? null : VSizes.defaultSpace,
      right: isEnglish ? VSizes.defaultSpace : null,
      bottom: VDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
          ),
          onPressed: () => notifier.nextPage(context),
          child: const Icon(
            Icons.arrow_forward_ios,
          )),
    );
  }
}
