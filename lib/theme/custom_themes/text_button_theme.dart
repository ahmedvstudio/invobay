import 'package:flutter/material.dart';

import '../../core/utils/constants/colors.dart';

class VTextButtonTheme {
  VTextButtonTheme._();

  // light
  static final lightTextButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(VColors.info),
    ),
  );

  // dark
  static final darkTextButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(VColors.info),
    ),
  );
}
