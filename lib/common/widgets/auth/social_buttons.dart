import 'package:flutter/material.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/image_strings.dart';
import '../../../core/utils/constants/sizes.dart';

class VSocialButtons extends StatelessWidget {
  const VSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: VColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              height: VSizes.iconMd,
              width: VSizes.iconMd,
              image: AssetImage(VImages.google),
            ),
          ),
        ),
        const SizedBox(width: VSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: VColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              height: VSizes.iconLg,
              width: VSizes.iconLg,
              image: AssetImage(VImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
