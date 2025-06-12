import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers/theme_providers/theme_related_providers.dart';
import '../../core/utils/constants/colors.dart';

class VElevatedButtonTheme {
  VElevatedButtonTheme._();

  /// Light Theme
  static ElevatedButtonThemeData lightElevatedButtonTheme(WidgetRef ref) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: VColors.white,
        backgroundColor: ref.watch(primaryColorProvider),
        iconColor: VColors.white,
        disabledForegroundColor: VColors.darkGrey,
        disabledBackgroundColor: VColors.grey,
        padding: const EdgeInsets.all(15),
        textStyle: const TextStyle(
            fontSize: 15, color: VColors.white, fontWeight: FontWeight.normal),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  /// Dark Theme
  static ElevatedButtonThemeData darkElevatedButtonTheme(WidgetRef ref) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: VColors.white,
        backgroundColor: ref.watch(primaryColorProvider),
        iconColor: VColors.white,
        disabledForegroundColor: VColors.darkGrey,
        disabledBackgroundColor: VColors.darkerGrey,
        padding: const EdgeInsets.all(15),
        textStyle: const TextStyle(
            fontSize: 15, color: VColors.white, fontWeight: FontWeight.normal),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
