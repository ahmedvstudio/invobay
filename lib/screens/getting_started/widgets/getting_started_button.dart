import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/features/controllers/getting_started_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class GettingStartedButton extends StatelessWidget {
  const GettingStartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return Positioned(
      right: VSizes.defaultSpace,
      bottom: VDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: isDark ? VColors.primary : Colors.black),
          onPressed: () => GettingStartedController.instance.nextPage(),
          child: const Icon(
            Iconsax.arrow_right_3,
          )),
    );
  }
}
