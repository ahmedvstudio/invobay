import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';

import '../../../database/hive/app_settings/app_settings.dart';

class AppSettingsNotifier extends StateNotifier<AsyncValue<AppSettings?>> {
  AppSettingsNotifier() : super(const AsyncValue.loading()) {
    loadSettings();
  }
  final _boxName = 'appSettingsBox';
  final _keyName = 'settings';

  Future<void> loadSettings() async {
    try {
      final box = await Hive.openBox<AppSettings>(_boxName);
      var savedDetail = box.get(_keyName);
      // If null, create and save default
      if (savedDetail == null) {
        savedDetail = AppSettings(
          currencySign: '\$',
          taxPercentage: 0.0,
          lowStockThreshold: 5,
          languageCode: 'en',
        );
        await box.put(_keyName, savedDetail);
      }
      state = AsyncValue.data(savedDetail);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateSettings(AppSettings appSettings) async {
    state = const AsyncValue.loading();
    try {
      final box = await Hive.openBox<AppSettings>(_boxName);
      await box.put(_keyName, appSettings);
      state = AsyncValue.data(appSettings);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateTax(double tax) async {
    final current = state.value;
    if (current == null) return;

    final updated = current.copyWith(taxPercentage: tax);
    await updateSettings(updated);
  }

  Future<void> resetSettings() async {
    final defaultSettings = AppSettings(
      currencySign: '\$',
      taxPercentage: 0.0,
      lowStockThreshold: 5,
      languageCode: 'en',
    );
    await updateSettings(defaultSettings);
  }
}
