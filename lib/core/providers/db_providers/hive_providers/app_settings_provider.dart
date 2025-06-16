import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/database/hive/app_settings/app_settings.dart';
import 'package:invobay/core/providers/db_providers/hive_providers/tax_fee_notifier.dart';

import 'app_settings_notifier.dart';

final appSettingsProvider =
    StateNotifierProvider<AppSettingsNotifier, AsyncValue<AppSettings?>>(
  (ref) => AppSettingsNotifier(),
);

/// --> Currency Sign Provider
final currencySignProvider = Provider<String>((ref) {
  return ref.watch(appSettingsProvider).maybeWhen(
        data: (settings) => settings?.currencySign ?? '\$',
        orElse: () => '\$',
      );
});

/// --> Tax Fee Provider
final taxFeeProvider = StateNotifierProvider<TaxFeeNotifier, double>((ref) {
  final hiveTax = ref.watch(appSettingsProvider).maybeWhen(
        data: (settings) => settings?.taxPercentage ?? 0.0,
        orElse: () => 0.0,
      );
  return TaxFeeNotifier(hiveTax);
});

/// --> Low Stock Threshold Provider
final lowStockThresholdProvider = StateProvider<int>((ref) {
  final threshold = ref.watch(appSettingsProvider).maybeWhen(
        data: (settings) => settings?.lowStockThreshold ?? 5,
        orElse: () => 5,
      );
  return threshold;
});

/// --> Language Code Provider
final localeProvider = Provider<Locale>((ref) {
  final appSettings = ref.watch(appSettingsProvider).value;
  return Locale(appSettings?.languageCode ?? 'en');
});
