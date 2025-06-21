import 'package:flutter/material.dart';
import 'package:invobay/core/utils/device/device_utility.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/constants/sizes.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(VSizes.defaultSpace),
      child: Column(
        children: [
          Lottie.asset(image,
              width: VDeviceUtils.getScreenWidth(context) * 0.8,
              height: VDeviceUtils.getScreenHeight(context) * 0.6),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: VSizes.spaceBtwItems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
