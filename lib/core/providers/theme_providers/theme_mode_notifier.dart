import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:invobay/core/database/hive/theme/app_theme.dart';

import '../../utils/constants/hive_box_strings.dart';

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system) {
    _loadTheme();
  }
  final _boxName = VHive.themeModeBox;
  final _keyName = VHive.selectedThemeKey;

  Future<void> _loadTheme() async {
    final box = await Hive.openBox<AppTheme>(_boxName);
    final appTheme = box.get(_keyName) ?? AppTheme.system;
    state = _convertToThemeMode(appTheme);
  }

  void setTheme(AppTheme appTheme) async {
    final box = await Hive.openBox<AppTheme>(_boxName);
    await box.put(_keyName, appTheme);
    state = _convertToThemeMode(appTheme);
  }

  ThemeMode _convertToThemeMode(AppTheme appTheme) {
    switch (appTheme) {
      case AppTheme.light:
        return ThemeMode.light;
      case AppTheme.dark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
