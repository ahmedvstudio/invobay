import 'package:flutter/material.dart';
import 'package:invobay/core/utils/constants/sizes.dart';

import '../../core/utils/constants/colors.dart';

class VBottomSheetTheme {
  VBottomSheetTheme._();

  /// Light Bottom Sheet Theme
  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: VColors.light,
    modalBackgroundColor: VColors.light,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(VSizes.borderRadiusXl)),
  );

  /// Dark Bottom Sheet Theme
  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: VColors.dark,
    modalBackgroundColor: VColors.dark,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(VSizes.borderRadiusXl)),
  );
}
