import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:invobay/generated/l10n.dart';
import 'navigator_key_provider.dart';

final localizationProvider = Provider<S>((ref) {
  final context = ref.watch(navigatorKeyProvider).currentContext;
  return context != null ? S.of(context) : S.current;
});

final localProvider = StateNotifierProvider<LocaleNotifier, Locale>(
  (ref) => LocaleNotifier(),
);

class LocaleNotifier extends StateNotifier<Locale> {
  static const _localeKey = 'locale';
  static const _boxName = 'appLanguage';

  LocaleNotifier() : super(const Locale('en')) {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final box = await Hive.openBox<String>(_boxName);
    final savedLocale = box.get(_localeKey, defaultValue: 'en');
    state = Locale(savedLocale!);
  }

  Future<void> setLocale(String languageCode) async {
    final box = await Hive.openBox<String>(_boxName);
    await box.put(_localeKey, languageCode);
    state = Locale(languageCode);
  }
}
