import 'package:intl/intl.dart';

class VFormatters {
  VFormatters._();
  //
  static String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyy').format(date);
  }

  static String formatVersionDate(DateTime date) {
    return DateFormat('dd/MM/yyyy hh:mm a', 'en').format(date);
  }

  static String formatBackupDate(DateTime date) {
    return DateFormat('yyyy-MM-dd_HH-mm', 'en').format(date);
  }

  static String formatHomeTime(DateTime date) {
    return DateFormat('hh:mm:ss a').format(date);
  }

  static String formatHomeDate(DateTime date) {
    return DateFormat('E yyyy/MM/dd').format(date);
  }

  //
  static formatPrice(double price) => price.toStringAsFixed(2);

  //
  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  //
  static formatPhoneNumber(String phoneNumber) {
    // Assuming format : (123) 456-7890
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }

    // Add more formatting if needed
    return phoneNumber;
  }

  static String buildFullAddress(List<String?> components) {
    return components.where((e) => e != null && e.isNotEmpty).join(', ');
  }
}
