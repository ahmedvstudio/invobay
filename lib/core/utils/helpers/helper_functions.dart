import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/enums.dart';
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
      controller.text = result.rawContent;
    }
  }

  static String receiptNo(int id) {
    return '[#${id.toString().padLeft(4, '0')}]';
  }

  static String paymentStatus(double debtAmount) {
    return debtAmount == 0 ? 'Completed' : 'Pending';
  }

  static String paymentStatusLabel(BuildContext context, String status) {
    return status == 'Completed' ? context.loc.completed : context.loc.pending;
  }

  static String getPaymentMethodLabel(BuildContext context, String name) {
    switch (name) {
      case 'Cash':
        return context.loc.cash;
      case 'MasterCard':
        return context.loc.masterCard;
      case 'Bank Transfer':
        return context.loc.bankTransfer;
      default:
        return name;
    }
  }

  static String getUnitLabel(BuildContext context, String unit) {
    switch (unit) {
      case 'Piece':
        return context.loc.unit_piece;
      case 'KG':
        return context.loc.unit_kg;
      case 'Bag':
        return context.loc.unit_bag;
      case 'Meter':
        return context.loc.unit_meter;
      case 'Litre':
        return context.loc.unit_liter;
      default:
        return unit; // fallback
    }
  }

  static String getOriginalUnit(BuildContext context, String localizedLabel) {
    if (localizedLabel == context.loc.unit_piece) return 'Piece';
    if (localizedLabel == context.loc.unit_kg) return 'KG';
    if (localizedLabel == context.loc.unit_bag) return 'Bag';
    if (localizedLabel == context.loc.unit_meter) return 'Meter';
    if (localizedLabel == context.loc.unit_liter) return 'Litre';
    return localizedLabel; // fallback
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

  static bool isEnglish(Locale locale) {
    return locale.languageCode.toLowerCase() == 'en';
  }

  static String getFontFamilyForLocale(Locale locale) {
    switch (locale.languageCode) {
      case 'ar':
        return VFonts.sansFamily; // Arabic
      case 'zh':
        return VFonts.sansFamily; // Chinese
      default:
        return VFonts.poppinsFamily; // Default
    }
  }

  static String getReceiptTitle(BuildContext context, ReceiptType type) {
    switch (type) {
      case ReceiptType.sell:
        return context.loc.editSalePayment;
      case ReceiptType.buy:
        return context.loc.editBuyPayment;
      case ReceiptType.returns:
        return context.loc.editReturnPayment;
    }
  }

  ///
  static String getTimeAgoGroup(BuildContext context, DateTime timestamp) {
    final now = DateTime.now();
    final diff = now.difference(timestamp);

    if (diff.inDays == 0) return context.loc.today;
    if (diff.inDays == 1) return context.loc.yesterday;
    if (diff.inDays < 7) return context.loc.lastWeek;
    if (diff.inDays < 30) return context.loc.thisMonth;
    return context.loc.older;
  }

  //
  static String currencyEmoji(Currency currency) {
    try {
      return CurrencyUtils.currencyToEmoji(currency);
    } catch (_) {
      return '🏳️';
    }
  }

  //
  static Future<String> getAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    return 'Stable ${info.version} (${VFormatters.formatVersionDate(info.updateTime ?? DateTime.now())})';
  }
}
