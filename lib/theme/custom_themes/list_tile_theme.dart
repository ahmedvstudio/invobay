import 'package:flutter/material.dart';

import '../../core/utils/constants/colors.dart';
import '../../core/utils/constants/sizes.dart';

class VListTileTheme {
  VListTileTheme._();

  /// --> Light
  static var lightListTileTheme = ListTileThemeData(
    iconColor: VColors.black,
    textColor: VColors.black,
    contentPadding: const EdgeInsets.only(left: VSizes.sm),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(VSizes.borderRadiusXl),
    ),
  );

  /// --> Dark
  static var darkListTileTheme = ListTileThemeData(
    iconColor: VColors.white,
    textColor: VColors.white,
    contentPadding: const EdgeInsets.only(left: VSizes.sm),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(VSizes.borderRadiusXl),
    ),
  );
}
