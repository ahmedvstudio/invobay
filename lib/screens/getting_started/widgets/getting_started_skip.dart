import 'package:flutter/material.dart';
import 'package:invobay/features/controllers/getting_started_controller.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';

class GettingStartedSkip extends StatelessWidget {
  const GettingStartedSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: VDeviceUtils.getAppbarHeight(),
        right: VSizes.defaultSpace,
        child: TextButton(
          onPressed: () => GettingStartedController.instance.skipPage(),
          child: const Text('Skip'),
        ));
  }
}
