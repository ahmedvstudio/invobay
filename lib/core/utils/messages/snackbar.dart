import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/constants/sizes.dart';

import '../constants/colors.dart';

/// ---< Global Scaffold Messenger Key >--- ///
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class VSnackbar {
  VSnackbar._();

  /// --< White SnackBar >--
  static void white(String message, {bool isFloating = true}) => _show(
      message: message,
      bgColor: VColors.white,
      textColor: VColors.black,
      isFloating: isFloating);

  /// --< Black SnackBar >--
  static void black(String message, {bool isFloating = true}) => _show(
      message: message,
      bgColor: VColors.black,
      textColor: VColors.white,
      isFloating: isFloating);

  /// --< Success SnackBar >--
  static void success(String message, {bool isFloating = true}) => _show(
      message: message,
      bgColor: VColors.success,
      textColor: VColors.white,
      isFloating: isFloating);

  /// --< Info SnackBar >--
  static void info(String message, {bool isFloating = true}) => _show(
      message: message,
      bgColor: VColors.info,
      textColor: VColors.white,
      isFloating: isFloating);

  /// --< Warning SnackBar >--
  static void warning(String message, {bool isFloating = true}) => _show(
      message: message,
      bgColor: VColors.warning,
      textColor: VColors.white,
      isFloating: isFloating);

  /// --< Error SnackBar >--
  static void error(String message, {bool isFloating = true}) => _show(
      message: message,
      bgColor: VColors.error,
      textColor: VColors.white,
      isFloating: isFloating);

  /// --< Success With Action SnackBar >--
  static void successWithAction(
    String message, {
    required String actionLabel,
    required VoidCallback onAction,
    bool isFloating = false,
    IconData icon = Iconsax.emoji_happy5,
  }) =>
      _show(
        message: message,
        bgColor: VColors.success,
        textColor: VColors.white,
        isFloating: isFloating,
        icon: icon,
        action: SnackBarAction(
          label: actionLabel,
          onPressed: onAction,
          textColor: VColors.info,
        ),
      );

  /// --< Error With Action SnackBar >--
  static void errorWithAction(
    String message, {
    required String actionLabel,
    required VoidCallback onAction,
    bool isFloating = false,
    IconData icon = Iconsax.emoji_sad5,
  }) =>
      _show(
        message: message,
        bgColor: VColors.error,
        textColor: VColors.white,
        isFloating: isFloating,
        icon: icon,
        action: SnackBarAction(
          label: actionLabel,
          onPressed: onAction,
          textColor: VColors.white,
        ),
      );

  /// --< Private Helper Methods >--
  static void _show({
    required String message,
    required Color bgColor,
    required Color textColor,
    bool isFloating = true,
    SnackBarAction? action,
    Duration? duration,
    IconData? icon,
  }) {
    final content = icon == null
        ? Text(message, style: TextStyle(color: textColor))
        : Row(
            children: [
              Icon(icon, color: textColor),
              const SizedBox(width: VSizes.sm),
              Expanded(
                  child: Text(message, style: TextStyle(color: textColor))),
            ],
          );
    scaffoldMessengerKey.currentState?.clearSnackBars();
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        behavior:
            isFloating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
        dismissDirection: action != null
            ? DismissDirection.none
            : (isFloating
                ? DismissDirection.horizontal
                : DismissDirection.down),
        content: content,
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            !isFloating ? 0 : VSizes.borderRadiusLg,
          ),
        ),
        action: action,
        duration: duration ??
            (action != null
                ? const Duration(seconds: 10)
                : const Duration(seconds: 4)),
      ),
    );
  }
}
