import 'package:flutter/material.dart';

import '../../core/utils/constants/sizes.dart';

class VSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: VSizes.appBarHeight,
    left: VSizes.defaultSpace,
    bottom: VSizes.defaultSpace,
    right: VSizes.defaultSpace,
  );
}
