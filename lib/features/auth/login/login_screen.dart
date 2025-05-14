import 'package:flutter/material.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

import '../../../common/styles/spacing_style.dart';
import '../../../common/widgets/auth/form_divider.dart';
import '../../../common/widgets/auth/social_buttons.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/constants/text_strings.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: VSpacingStyle.withAppBarHeight,
          child: Column(
            children: [
              // Logo, title, subtitle
              const LoginHeader(),

              // Form
              const LoginForm(),

              // Divider

              VFormDivider(
                  dividerText: VHelperFunctions.capitalize(VText.orSignInWith)),
              const SizedBox(height: VSizes.spaceBtwItems),
              // Footer
              const VSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
