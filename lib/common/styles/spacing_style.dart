import 'package:flutter/material.dart';

import '../../core/utils/constants/sizes.dart';
import '../../core/utils/device/device_utility.dart';

class VSpacingStyle {
  VSpacingStyle._();

  static const EdgeInsetsGeometry withAppBarHeight = EdgeInsets.only(
    top: VSizes.appBarHeight,
    left: VSizes.defaultSpace,
    bottom: VSizes.defaultSpace,
    right: VSizes.defaultSpace,
  );
  static const EdgeInsetsGeometry withoutTop = EdgeInsets.only(
    left: VSizes.defaultSpace,
    bottom: VSizes.defaultSpace,
    right: VSizes.defaultSpace,
  );
  static const EdgeInsetsGeometry withoutBottom = EdgeInsets.only(
    left: VSizes.defaultSpace,
    top: VSizes.defaultSpace,
    right: VSizes.defaultSpace,
  );

  static EdgeInsetsGeometry responseKeyboard(BuildContext context) {
    return EdgeInsets.only(
      left: VSizes.defaultSpace,
      right: VSizes.defaultSpace,
      bottom: VDeviceUtils.getKeyboardHeight(context) + VSizes.spaceBtwItems,
    );
  }

  static const EdgeInsetsGeometry all = EdgeInsets.all(VSizes.defaultSpace);

  static const EdgeInsetsGeometry horizontal =
      EdgeInsets.symmetric(horizontal: VSizes.defaultSpace);

  static const EdgeInsetsGeometry vertical =
      EdgeInsets.symmetric(vertical: VSizes.defaultSpace);

  static const EdgeInsets symmetric = EdgeInsets.symmetric(
      horizontal: VSizes.defaultSpace, vertical: VSizes.defaultSpace);
}
