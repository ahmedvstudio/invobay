import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/router/router_constant.dart';

import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(VSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // head
            Text(
              VText.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            Text(
              VText.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: VSizes.spaceBtwSections * 2),

            // fields
            TextFormField(
              decoration: const InputDecoration(
                  labelText: VText.email,
                  prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(height: VSizes.spaceBtwSections),

            // button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.goNamed(VRouter.resetPass),
                child: const Text(VText.submit),
              ),
            )
          ],
        ),
      ),
    );
  }
}
