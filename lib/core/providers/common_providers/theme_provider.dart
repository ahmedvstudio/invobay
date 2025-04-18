import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:invobay/core/database/hive/theme/app_theme.dart';

final themeModeProvider =
    StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier();
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final box = await Hive.openBox<AppTheme>('themeBox');
    final appTheme = box.get('selected') ?? AppTheme.system;
    state = _convertToThemeMode(appTheme);
  }

  void setTheme(AppTheme appTheme) async {
    final box = await Hive.openBox<AppTheme>('themeBox');
    await box.put('selected', appTheme);
    state = _convertToThemeMode(appTheme); // 🔥 Triggers rebuild
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
