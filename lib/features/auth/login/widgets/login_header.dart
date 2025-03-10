import 'package:flutter/material.dart';

import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/constants/text_strings.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image:
              AssetImage(isDark ? VImages.lightAppLogo : VImages.darkAppLogo),
        ),
        Text(VText.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: VSizes.sm),
        Text(VText.loginSubtitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
