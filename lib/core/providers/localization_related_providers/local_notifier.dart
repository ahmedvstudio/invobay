import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import '../../database/hive/app_settings/app_settings.dart';

class LocaleNotifier extends StateNotifier<Locale> {
  static const _boxName = 'appSettingsBox';

  LocaleNotifier() : super(const Locale('en')) {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final box = await Hive.openBox<AppSettings>(_boxName);
    final settings = box.get('settings');
    if (settings != null) {
      state = Locale(settings.languageCode);
    }
  }

  Future<void> setLocale(String languageCode) async {
    final box = await Hive.openBox<AppSettings>(_boxName);
    final settings = box.get('settings');

    if (settings != null) {
      final updated = AppSettings(
        currencySign: settings.currencySign,
        taxPercentage: settings.taxPercentage,
        lowStockThreshold: settings.lowStockThreshold,
        languageCode: languageCode,
      );
      await box.put('settings', updated);
      state = Locale(languageCode);
    }
  }
}
