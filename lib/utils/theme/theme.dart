import 'package:flutter/material.dart';
import 'package:invobay/utils/theme/custom_thems/appbar_theme.dart';
import 'package:invobay/utils/theme/custom_thems/bottom_sheets_theme.dart';
import 'package:invobay/utils/theme/custom_thems/checkbox_theme.dart';
import 'package:invobay/utils/theme/custom_thems/chip_theme.dart';
import 'package:invobay/utils/theme/custom_thems/elevated_button_theme.dart';
import 'package:invobay/utils/theme/custom_thems/text_theme.dart';
import 'package:invobay/utils/theme/custom_thems/textformfield_theme.dart';

class VAppTheme {
  VAppTheme._();

  /// Light Mode Theme
  static ThemeData lightTheme = ThemeData(
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
  );

  /// Dark Mode Theme
  static ThemeData darkTheme = ThemeData(
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
  );
}
