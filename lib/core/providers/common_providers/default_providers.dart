import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/utils/constants/colors.dart';

import '../../database/drift/app_database.dart';
import '../../utils/constants/enums.dart';

// --> AppBar Color Provider
final appbarColorProvider = StateProvider<Color>((ref) {
  return VColors.primary;
});

// --> Filtered Item Provider
final filteredItemsProvider =
    StateProvider.autoDispose<List<Item>>((ref) => []);

// --> is Address selected
final addressSelectedProvider =
    StateProvider.family<bool, String>((ref, id) => false);

// --> Receipts Navigation Provider
final receiptsNavigationProvider = StateProvider<int>((ref) {
  return 0;
});

// --> Discount Provider
final discountProvider = StateProvider<double>((ref) => 0.0);
final discountTypeProvider =
    StateProvider.autoDispose<DiscountType>((ref) => DiscountType.percentage);
final discountAppliedProvider = StateProvider<bool>((ref) => false);
final showDiscountInputProvider = StateProvider<bool>((ref) => false);

final discountControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});

// -->
final paidAmountControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});

// --> Customer Or Supplier Provider
final isCustomerProvider = StateProvider<bool>((ref) => true);

// --> Shipping and Tax fees
final shippingFeeProvider = StateProvider<double>((ref) => 0.0);

// --> Temporary Quantity Provider
final addQuantityProvider = StateProvider<String>((ref) => '');
final quantityProvider = StateProvider.autoDispose<String>((ref) => '');
final buyPriceProvider = StateProvider.autoDispose<String>((ref) => '');

// --> Subtotal Provider
final subtotalPriceProvider = StateProvider<double>((ref) => 0.0);

// --> Customer Details Provider
final customerNameProvider = StateProvider<String>((ref) => '');
final customerIDProvider = StateProvider<int>((ref) => 0);
final customerPhoneProvider = StateProvider<String>((ref) => '');
final customerAddressProvider = StateProvider<String>((ref) => '');

// --> Supplier Details Provider
final supplierNameProvider = StateProvider<String>((ref) => '');
final supplierIDProvider = StateProvider<int>((ref) => 0);
final supplierPhoneProvider = StateProvider<String>((ref) => '');
final supplierAddressProvider = StateProvider<String>((ref) => '');

//
final dateRangeProvider = StateProvider<DateTimeRange>((ref) {
  final now = DateTime.now();
  return DateTimeRange(
    start: now.subtract(const Duration(days: 6)),
    end: now,
  );
});

//
final selectedDateProvider =
    StateProvider.autoDispose<DateTime?>((ref) => null);
