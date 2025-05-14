import 'package:flutter/material.dart';
import 'package:invobay/core/utils/constants/sizes.dart';

import '../constants/colors.dart';

class VSnackbar {
  VSnackbar._();

  /// --> white SnackBar
  static void white({
    required BuildContext context,
    required String message,
    bool isFloating = true,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: isFloating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
      dismissDirection:
          isFloating ? DismissDirection.horizontal : DismissDirection.down,
      content:
          Text(message, style: const TextStyle().apply(color: VColors.black)),
      backgroundColor: VColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: isFloating
            ? BorderRadius.circular(VSizes.borderRadiusLg)
            : BorderRadius.zero,
      ),
    ));
  }

  /// --> black SnackBar
  static void black({
    required BuildContext context,
    required String message,
    bool isFloating = true,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: isFloating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
      dismissDirection:
          isFloating ? DismissDirection.horizontal : DismissDirection.down,
      content:
          Text(message, style: const TextStyle().apply(color: VColors.white)),
      backgroundColor: VColors.black,
      shape: RoundedRectangleBorder(
        borderRadius: isFloating
            ? BorderRadius.circular(VSizes.borderRadiusLg)
            : BorderRadius.zero,
      ),
    ));
  }

  /// --> success SnackBar
  static void success({
    required BuildContext context,
    required String message,
    bool isFloating = true,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: isFloating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
      dismissDirection:
          isFloating ? DismissDirection.horizontal : DismissDirection.down,
      content:
          Text(message, style: const TextStyle().apply(color: VColors.white)),
      backgroundColor: VColors.success,
      shape: RoundedRectangleBorder(
        borderRadius: isFloating
            ? BorderRadius.circular(VSizes.borderRadiusLg)
            : BorderRadius.zero,
      ),
    ));
  }

  /// --> info SnackBar
  static void info({
    required BuildContext context,
    required String message,
    bool isFloating = true,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: isFloating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
      dismissDirection:
          isFloating ? DismissDirection.horizontal : DismissDirection.down,
      content:
          Text(message, style: const TextStyle().apply(color: VColors.white)),
      backgroundColor: VColors.info,
      shape: RoundedRectangleBorder(
        borderRadius: isFloating
            ? BorderRadius.circular(VSizes.borderRadiusLg)
            : BorderRadius.zero,
      ),
    ));
  }

  /// --> warning SnackBar
  static void warning({
    required BuildContext context,
    required String message,
    bool isFloating = true,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: isFloating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
      dismissDirection:
          isFloating ? DismissDirection.horizontal : DismissDirection.down,
      content:
          Text(message, style: const TextStyle().apply(color: VColors.white)),
      backgroundColor: VColors.warning,
      shape: RoundedRectangleBorder(
        borderRadius: isFloating
            ? BorderRadius.circular(VSizes.borderRadiusLg)
            : BorderRadius.zero,
      ),
    ));
  }

  /// --> error SnackBar
  static void error({
    required BuildContext context,
    required String message,
    bool isFloating = true,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: isFloating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
      dismissDirection:
          isFloating ? DismissDirection.horizontal : DismissDirection.down,
      content:
          Text(message, style: const TextStyle().apply(color: VColors.white)),
      backgroundColor: VColors.error,
      shape: RoundedRectangleBorder(
        borderRadius: isFloating
            ? BorderRadius.circular(VSizes.borderRadiusLg)
            : BorderRadius.zero,
      ),
    ));
  }

  /// --> Custom SnackBar
}
