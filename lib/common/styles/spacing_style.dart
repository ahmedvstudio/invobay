import 'package:flutter/material.dart';

import '../../core/utils/constants/sizes.dart';

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
  static const EdgeInsetsGeometry all = EdgeInsets.all(VSizes.defaultSpace);

  static const EdgeInsetsGeometry horizontal =
      EdgeInsets.symmetric(horizontal: VSizes.defaultSpace);

  static const EdgeInsetsGeometry vertical =
      EdgeInsets.symmetric(vertical: VSizes.defaultSpace);
}
