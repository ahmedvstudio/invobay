import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils/constants/image_strings.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/constants/text_strings.dart';
import '../../../core/utils/device/device_utility.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(VSizes.defaultSpace),
        child: Column(
          children: [
            // image
            Lottie.asset(
              VImages.verifyEmail,
              width: VDeviceUtils.getScreenWidth(context) * 0.6,
            ),
            const SizedBox(height: VSizes.spaceBtwSections),

            // title and sub
            Text(
              VText.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            Text(
              VText.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: VSizes.spaceBtwSections),

            // button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(VText.done),
              ),
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: const Text(VText.resendEmail),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
