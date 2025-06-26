import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/constants/image_strings.dart';
import 'package:invobay/core/utils/device/device_utility.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils/constants/sizes.dart';
import '../../styles/spacing_style.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    this.image,
    this.title,
    this.subTitle,
    this.onPressed,
  });
  final String? image, title, subTitle;
  final VoidCallback? onPressed;
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
                image ?? VImages.success1,
                width: VDeviceUtils.getScreenWidth(context) * 0.6,
              ),
              const SizedBox(height: VSizes.spaceBtwSections),

              // title and sub
              Text(
                title ?? context.loc.success,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: VSizes.spaceBtwItems),
              Text(
                subTitle ?? context.loc.receiptSavedSuccessfully,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: VSizes.spaceBtwSections),

              //button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed ?? () => context.pop(),
                  child: Text(context.loc.continue1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
