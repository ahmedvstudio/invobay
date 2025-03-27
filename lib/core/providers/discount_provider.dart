import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Discount provider

final discountProvider = StateProvider<double>((ref) => 0.0);
final discountAppliedProvider = StateProvider<bool>((ref) => false);
final discountControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});
