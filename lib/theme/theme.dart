import 'package:flutter/material.dart';
import 'package:invobay/theme/custom_themes/appbar_theme.dart';
import 'package:invobay/theme/custom_themes/bottom_navigation_bar_theme.dart';
import 'package:invobay/theme/custom_themes/bottom_sheets_theme.dart';
import 'package:invobay/theme/custom_themes/checkbox_theme.dart';
import 'package:invobay/theme/custom_themes/chip_theme.dart';
import 'package:invobay/theme/custom_themes/elevated_button_theme.dart';
import 'package:invobay/theme/custom_themes/floating_action_button_theme.dart';
import 'package:invobay/theme/custom_themes/list_tile_theme.dart';
import 'package:invobay/theme/custom_themes/outline_button_theme.dart';
import 'package:invobay/theme/custom_themes/text_theme.dart';
import 'package:invobay/theme/custom_themes/textformfield_theme.dart';

import '../core/utils/constants/colors.dart';
import 'custom_themes/segmented_button_theme.dart';
import 'custom_themes/text_button_theme.dart';

class VAppTheme {
  VAppTheme._();

  /// Light Mode Theme
  static ThemeData lightTheme({required String fontFamily}) => ThemeData(
        fontFamily: fontFamily,
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: VColors.light,
        textTheme: VTextTheme.lightTextTheme,
        elevatedButtonTheme: VElevatedButtonTheme.lightElevatedButtonTheme,
        appBarTheme: VAppBarTheme.lightAppBarTheme,
        bottomSheetTheme: VBottomSheetTheme.lightBottomSheetTheme,
        checkboxTheme: VCheckBoxTheme.lightCheckBoxTheme,
        chipTheme: VChipTheme.lightChipTheme,
        inputDecorationTheme: VTextFormFiledTheme.lightInputDecorationTheme,
        floatingActionButtonTheme: VFloatingActionButtonTheme.lightFABTheme,
        outlinedButtonTheme: VOutlinedButtonTheme.lightOutlineButtonTheme,
        textButtonTheme: VTextButtonTheme.lightTextButtonTheme,
        bottomNavigationBarTheme:
            VBottomNavigationBarTheme.lightBottomNavigationBarTheme,
        segmentedButtonTheme: VSegmentedButtonTheme.lightSegmentedButtonTheme,
        listTileTheme: VListTileTheme.lightListTileTheme,
      );

  /// Dark Mode Theme
  static ThemeData darkTheme({required String fontFamily}) => ThemeData(
        fontFamily: fontFamily,
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: VColors.dark,
        textTheme: VTextTheme.darkTextTheme,
        elevatedButtonTheme: VElevatedButtonTheme.darkElevatedButtonTheme,
        appBarTheme: VAppBarTheme.darkAppBarTheme,
        bottomSheetTheme: VBottomSheetTheme.darkBottomSheetTheme,
        checkboxTheme: VCheckBoxTheme.darkCheckBoxTheme,
        chipTheme: VChipTheme.darkChipTheme,
        inputDecorationTheme: VTextFormFiledTheme.darkInputDecorationTheme,
        floatingActionButtonTheme: VFloatingActionButtonTheme.darkFABTheme,
        outlinedButtonTheme: VOutlinedButtonTheme.darkOutlineButtonTheme,
        textButtonTheme: VTextButtonTheme.darkTextButtonTheme,
        bottomNavigationBarTheme:
            VBottomNavigationBarTheme.darkBottomNavigationBarTheme,
        segmentedButtonTheme: VSegmentedButtonTheme.darkSegmentedButtonTheme,
        listTileTheme: VListTileTheme.darkListTileTheme,
      );
}
