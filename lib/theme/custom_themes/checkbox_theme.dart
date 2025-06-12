import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers/theme_providers/theme_related_providers.dart';

class VCheckBoxTheme {
  VCheckBoxTheme._();

  /// Light Checkbox Theme
  static CheckboxThemeData lightCheckBoxTheme(WidgetRef ref) {
    return CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        } else {
          return Colors.black;
        }
      }),
      fillColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return ref.watch(primaryColorProvider);
          } else {
            return Colors.transparent;
          }
        },
      ),
    );
  }

  /// Dark Checkbox Theme
  static CheckboxThemeData darkCheckBoxTheme(WidgetRef ref) {
    return CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        } else {
          return Colors.black;
        }
      }),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ref.watch(primaryColorProvider);
        } else {
          return Colors.transparent;
        }
      }),
    );
  }
}
