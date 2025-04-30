import 'package:flutter/material.dart';

import '../../core/utils/constants/colors.dart';

class VBottomNavigationBarTheme {
  VBottomNavigationBarTheme._();

  /// Light Bottom NavigationBar Theme
  static const lightBottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: VColors.kPrimary,
    selectedIconTheme: IconThemeData(color: VColors.white),
    unselectedIconTheme: IconThemeData(color: VColors.onPrimary),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedItemColor: VColors.white,
    unselectedItemColor: VColors.onPrimary,
  );

  /// Dark Bottom NavigationBar Theme
  static const darkBottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: VColors.kPrimary,
    selectedIconTheme: IconThemeData(color: VColors.white),
    unselectedIconTheme: IconThemeData(color: VColors.onPrimary),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedItemColor: VColors.white,
    unselectedItemColor: VColors.onPrimary,
  );
}
