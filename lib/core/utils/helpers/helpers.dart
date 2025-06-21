import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class VHelpers {
  VHelpers._();

  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  static bool isValidPhone(String phone) {
    final regex = RegExp(r'^\d{10}$');
    return regex.hasMatch(phone);
  }

//date as string
  static String formatDate(DateTime date, {String pattern = 'yyyy-MM-dd'}) {
    return DateFormat(pattern).format(date);
  }

//date from string
  static DateTime? parseDate(String str, {String pattern = 'yyyy-MM-dd'}) {
    try {
      return DateFormat(pattern).parse(str);
    } catch (_) {
      return null;
    }
  }

  // generate random string
  static String randomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final rand = Random();
    return List.generate(length, (_) => chars[rand.nextInt(chars.length)])
        .join();
  }

  static bool isNullOrEmpty(String? str) {
    return str == null || str.trim().isEmpty;
  }

  static bool isListNullOrEmpty(List? list) {
    return list == null || list.isEmpty;
  }

  //
  static Future<List<File>?> pickFiles(
      {bool allowMultiple = false, List<String>? allowedExtensions}) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: allowMultiple,
        type: allowedExtensions != null ? FileType.custom : FileType.any,
        allowedExtensions: allowedExtensions,
      );
      if (result != null && result.files.isNotEmpty) {
        return result.paths.map((p) => File(p!)).toList();
      }
    } catch (_) {}
    return null;
  }

  //
  static Future<File?> pickImage({bool fromCamera = false}) async {
    final picker = ImagePicker();
    XFile? img = await picker.pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery);
    if (img != null) return File(img.path);
    return null;
  }

  static Future<File?> pickVideo({bool fromCamera = false}) async {
    final picker = ImagePicker();
    XFile? vid = await picker.pickVideo(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery);
    if (vid != null) return File(vid.path);
    return null;
  }
}
