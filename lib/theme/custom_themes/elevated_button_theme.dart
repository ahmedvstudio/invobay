import 'package:flutter/material.dart';

import '../../core/utils/constants/colors.dart';

class VElevatedButtonTheme {
  VElevatedButtonTheme._();

  /// Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: VColors.white,
      backgroundColor: VColors.buttonPrimary,
      iconColor: VColors.white,
      disabledForegroundColor: VColors.darkGrey,
      disabledBackgroundColor: VColors.grey,
      side: const BorderSide(color: VColors.buttonPrimary),
      padding: const EdgeInsets.all(15),
      textStyle: const TextStyle(
          fontSize: 15, color: VColors.white, fontWeight: FontWeight.normal),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  /// Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: VColors.white,
      backgroundColor: VColors.buttonPrimary,
      iconColor: VColors.white,
      disabledForegroundColor: VColors.darkGrey,
      disabledBackgroundColor: VColors.darkerGrey,
      side: const BorderSide(color: VColors.buttonPrimary),
      padding: const EdgeInsets.all(15),
      textStyle: const TextStyle(
          fontSize: 15, color: VColors.white, fontWeight: FontWeight.normal),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
