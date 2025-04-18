import 'package:flutter/material.dart';

import '../../core/utils/constants/colors.dart';

class VSegmentedButtonTheme {
  VSegmentedButtonTheme._();

  /// Light SegmentedButton Theme
  static final lightSegmentedButtonTheme = SegmentedButtonThemeData(
    style: SegmentedButton.styleFrom(
      selectedBackgroundColor: VColors.kAccent.withValues(alpha: 0.4),
      iconColor: VColors.primary,
    ),
  );

  /// Dark SegmentedButton Theme
  static final darkSegmentedButtonTheme = SegmentedButtonThemeData(
    style: SegmentedButton.styleFrom(
      selectedBackgroundColor: VColors.kAccent.withValues(alpha: 0.4),
      iconColor: VColors.primaryDark,
    ),
  );
}
