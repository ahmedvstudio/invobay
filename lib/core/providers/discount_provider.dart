import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/providers/sub_total_provider.dart';

// Discount provider

final discountProvider = StateProvider<double>((ref) => 0.0);
final discountAppliedProvider = StateProvider<bool>((ref) => false);
final discountControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final discountedSubtotal = Provider<double>((ref) {
  final subtotalPrice = ref.watch(subtotalPriceProvider);

  final discount = ref.watch(discountProvider);

  final discountAmount = subtotalPrice * (discount / 100);
  final discountedSubtotal = subtotalPrice - discountAmount;
  return discountedSubtotal;
});
