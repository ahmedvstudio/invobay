import 'package:flutter/material.dart';
import 'package:invobay/core/utils/device/device_utility.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/constants/text_strings.dart';
import '../../styles/spacing_style.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });
  final String image, title, subTitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: VSpacingStyle.withAppBarHeight * 2,
          child: Column(
            children: [
              // image
              Lottie.asset(
                image,
                width: VDeviceUtils.getScreenWidth(context) * 0.6,
              ),
              const SizedBox(height: VSizes.spaceBtwSections),

              // title and sub
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: VSizes.spaceBtwItems),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: VSizes.spaceBtwSections),

              //button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(VText.vContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
