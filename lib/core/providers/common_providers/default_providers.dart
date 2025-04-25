import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/utils/constants/colors.dart';

// --> AppBar Color Provider
final appbarColorProvider = StateProvider<Color>((ref) {
  return VColors.kPrimary;
});

// --> Receipts Navigation Provider
final receiptsNavigationProvider = StateProvider<int>((ref) {
  return 0;
});

// --> Discount Provider
final discountProvider = StateProvider<double>((ref) => 0.0);
final discountAppliedProvider = StateProvider<bool>((ref) => false);
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
final addQuantityProvider = StateProvider.autoDispose<String>((ref) => '');
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
