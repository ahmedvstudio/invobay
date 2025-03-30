import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// --> Receipts Navigation Provider
final receiptsNavigationProvider = StateProvider<int>((ref) {
  return 0;
});

// --> Currency Sign Provider
final currencySignProvider = StateProvider<String>((ref) => '\$');

// --> Discount Provider
final discountProvider = StateProvider<double>((ref) => 0.0);
final discountAppliedProvider = StateProvider<bool>((ref) => false);
final discountControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

// --> Customer Or Supplier Provider
final isCustomerProvider = StateProvider<bool>((ref) => true);

// --> Shipping and Tax fees
final shippingFeeProvider = StateProvider<double>((ref) => 0.6);
final taxFeeProvider = StateProvider<double>((ref) => 5.0);

// --> Temporary Quantity Provider
final addQuantityProvider = StateProvider.autoDispose<String>((ref) => '');
final quantityProvider = StateProvider.autoDispose<String>((ref) => '');

// --> Subtotal Provider
final subtotalPriceProvider = StateProvider<double>((ref) => 0.0);

// --> Customer Details Provider
final customerNameProvider = StateProvider<String>((ref) => 'Customer');
final customerPhoneProvider = StateProvider<String>((ref) => '+91 9876543210');
final customerAddressProvider =
    StateProvider<String>((ref) => 'South Liana, Maine 04028');
