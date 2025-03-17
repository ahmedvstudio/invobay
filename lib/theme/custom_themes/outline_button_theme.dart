import 'package:flutter/material.dart';

import '../../core/utils/constants/colors.dart';

class VOutlinedButtonTheme {
  VOutlinedButtonTheme._();

  // light
  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      disabledForegroundColor: VColors.darkGrey,
      disabledBackgroundColor: VColors.darkGrey,
      foregroundColor: VColors.black,
      side: const BorderSide(color: VColors.darkGrey),
      padding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(
        fontFamily: 'Poppins',
      ),
    ),
  );

  // Dark
  static final darkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      disabledForegroundColor: VColors.darkGrey,
      disabledBackgroundColor: VColors.darkGrey,
      foregroundColor: VColors.white,
      side: const BorderSide(color: VColors.grey),
      padding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(
        fontFamily: 'Poppins',
      ),
    ),
  );
}
