import 'package:intl/intl.dart';

class VFormatters {
  VFormatters._();
  //
  static formatDate(DateTime date) => DateFormat.yMd().format(date);
  static String formatDates(DateTime date) {
    return DateFormat('dd-MMM-yyy').format(date);
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
}
