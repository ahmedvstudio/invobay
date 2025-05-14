import 'package:flutter/material.dart';

import '../../core/utils/constants/colors.dart';
import '../../core/utils/constants/sizes.dart';

class VListTileTheme {
  VListTileTheme._();

  /// --> Light
  static var lightListTileTheme = ListTileThemeData(
    tileColor: VColors.primary.withValues(alpha: 0.2),
    iconColor: VColors.black,
    textColor: VColors.black,
    contentPadding: const EdgeInsets.only(left: VSizes.sm),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(VSizes.borderRadiusXl),
    ),
  );

  /// --> Dark
  static var darkListTileTheme = ListTileThemeData(
    tileColor: VColors.primary.withValues(alpha: 0.4),
    iconColor: VColors.white,
    textColor: VColors.white,
    contentPadding: const EdgeInsets.only(left: VSizes.sm),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(VSizes.borderRadiusXl),
    ),
  );
}
