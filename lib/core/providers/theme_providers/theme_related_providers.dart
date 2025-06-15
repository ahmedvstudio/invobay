import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/providers/theme_providers/theme_mode_notifier.dart';
import 'package:invobay/core/utils/constants/lists.dart';

import 'color_index_notifier.dart';

final primaryColorProvider = Provider<Color>((ref) {
  final index = ref.watch(colorIndexProvider);
  return VLists.colors[index];
});

final colorIndexProvider =
    StateNotifierProvider<ColorIndexNotifier, int>((ref) {
  return ColorIndexNotifier();
});

//
final themeModeProvider =
    StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier();
});
