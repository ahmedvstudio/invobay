import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/font_strings.dart';

class VHelperFunctions {
  VHelperFunctions._();
  // Colors Helper
  static Color? getColor(String value) {
    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    } else {
      return null;
    }
  }

  static String capitalize(String text) {
    if (text.isEmpty) {
      return text;
    }
    String capitalizedText = text[0].toUpperCase() + text.substring(1);
    return capitalizedText;
  }

  static void showAlert(BuildContext context, String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'))
            ],
          );
        });
  }

  static Future<void> showCustomDialog({
    required BuildContext context,
    required String title,
    required Widget content,
    required VoidCallback onSaved,
    String? buttonText,
  }) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(title),
            content: content,
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: onSaved,
                child: Text(buttonText ?? 'Save'),
              )
            ],
          );
        });
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Future<void> scanBarcode(TextEditingController controller) async {
    final result = await BarcodeScanner.scan();

    if (result.type == ResultType.Barcode) {
      controller.text =
          result.rawContent; // Update the controller with the scanned code
    }
  }

  static String receiptNo(int id) {
    return '[#${id.toString().padLeft(4, '0')}]';
  }

  static String paymentStatus(double debtAmount) {
    return debtAmount == 0 ? 'Completed' : 'Pending';
  }

  static String calculateTotalPrice({
    required double subtotal,
    required double taxFee,
    required double discount,
    required double shippingFee,
  }) {
    final taxAmount = subtotal * (taxFee / 100);
    final discountAmount = subtotal * (discount / 100);
    final discountedAmount = subtotal - discountAmount;
    final total = discountedAmount + taxAmount + shippingFee;
    final formattedTotal = VFormatters.formatPrice(total);
    return formattedTotal;
  }

  static Future<void> makePhoneCall(String? phoneNumber) async {
    if (phoneNumber == null || phoneNumber.isEmpty) return;
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  static String getFontFamilyForLocale(Locale locale) {
    switch (locale.languageCode) {
      case 'ar':
        return VFonts.dubaiFamily; // Arabic
      case 'zh':
        return VFonts.sansFamily; // Chinese
      default:
        return VFonts.poppinsFamily; // Default
    }
  }
}
