import 'package:flutter/material.dart';
import 'package:invobay/core/utils/constants/sizes.dart';

import '../../core/utils/constants/colors.dart';

class VFloatingActionButtonTheme {
  VFloatingActionButtonTheme._();

  /// Light theme
  static const lightFABTheme = FloatingActionButtonThemeData(
    backgroundColor: VColors.kPrimary,
    foregroundColor: VColors.white,
    iconSize: VSizes.iconLg,
    shape: CircleBorder(),
  );

  /// Dark theme
  static const darkFABTheme = FloatingActionButtonThemeData(
    backgroundColor: VColors.kPrimary,
    foregroundColor: VColors.white,
    iconSize: VSizes.iconLg,
    shape: CircleBorder(),
  );
}
