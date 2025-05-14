import 'package:fluttertoast/fluttertoast.dart';

import '../constants/colors.dart';

class VToast {
  VToast._();

  /// --> white Toast
  static void white({required String message, ToastGravity? gravity}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity,
      backgroundColor: VColors.white,
      textColor: VColors.black,
    );
  }

  /// --> black Toast
  static void black({required String message, ToastGravity? gravity}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity,
      backgroundColor: VColors.black,
      textColor: VColors.white,
    );
  }

  /// --> success Toast
  static void success({required String message, ToastGravity? gravity}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity,
      backgroundColor: VColors.success,
      textColor: VColors.white,
    );
  }

  /// --> info Toast
  static void info({required String message, ToastGravity? gravity}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity,
      backgroundColor: VColors.info,
      textColor: VColors.white,
    );
  }

  /// --> warning Toast
  static void warning({required String message, ToastGravity? gravity}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity,
      backgroundColor: VColors.warning,
      textColor: VColors.white,
    );
  }

  /// --> error Toast
  static void error({required String message, ToastGravity? gravity}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity,
      backgroundColor: VColors.error,
      textColor: VColors.white,
    );
  }
}
