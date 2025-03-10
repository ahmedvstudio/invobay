import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/router/router_constant.dart';

import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: VSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            // Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: VText.email,
              ),
            ),
            const SizedBox(height: VSizes.spaceBtwInputFelids),
            //Password
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: VText.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: VSizes.spaceBtwInputFelids / 2),

            //Remember me + forgot
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remember
                Row(
                  children: [
                    //check
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(VText.rememberMe),
                  ],
                ),
                //forgot
                TextButton(
                  onPressed: () => context.pushNamed(VRouter.forgetPass),
                  child: const Text(VText.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: VSizes.spaceBtwSections),

            // Sign in
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Get.to(() => const NavigationMenu());
                },
                child: const Text(VText.signIn),
              ),
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            // create new
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => context.pushNamed(VRouter.signup),
                child: const Text(VText.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
