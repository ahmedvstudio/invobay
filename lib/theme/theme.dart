import 'package:flutter/material.dart';
import 'package:invobay/theme/custom_themes/appbar_theme.dart';
import 'package:invobay/theme/custom_themes/bottom_sheets_theme.dart';
import 'package:invobay/theme/custom_themes/checkbox_theme.dart';
import 'package:invobay/theme/custom_themes/chip_theme.dart';
import 'package:invobay/theme/custom_themes/elevated_button_theme.dart';
import 'package:invobay/theme/custom_themes/floating_action_button_theme.dart';
import 'package:invobay/theme/custom_themes/outline_button_theme.dart';
import 'package:invobay/theme/custom_themes/text_theme.dart';
import 'package:invobay/theme/custom_themes/textformfield_theme.dart';

class VAppTheme {
  VAppTheme._();

  /// Light Mode Theme
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blue,
    textTheme: VTextTheme.lightTextTheme,
    elevatedButtonTheme: VElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: VAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: VBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: VCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: VChipTheme.lightChipTheme,
    inputDecorationTheme: VTextFormFiledTheme.lightInputDecorationTheme,
    floatingActionButtonTheme: VFloatingActionButtonTheme.lightFABTheme,
    outlinedButtonTheme: VOutlinedButtonTheme.lightOutlineButtonTheme,
  );

  /// Dark Mode Theme
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.blue,
    textTheme: VTextTheme.darkTextTheme,
    elevatedButtonTheme: VElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: VAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: VBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: VCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: VChipTheme.darkChipTheme,
    inputDecorationTheme: VTextFormFiledTheme.darkInputDecorationTheme,
    floatingActionButtonTheme: VFloatingActionButtonTheme.darkFABTheme,
    outlinedButtonTheme: VOutlinedButtonTheme.darkOutlineButtonTheme,
  );
}
