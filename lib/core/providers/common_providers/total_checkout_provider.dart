import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../db_providers/hive_providers/app_settings_provider.dart';
import 'default_providers.dart';

final totalAmountProvider = Provider<double>((ref) {
  final subtotalPrice = ref.watch(discountedSubtotal);
  final shippingFee = ref.watch(shippingFeeProvider);
  final taxFee = ref.watch(taxFeeProvider);

  // Calculating Taxes
  final taxAmount = subtotalPrice * (taxFee / 100);

  // Calculate the total amount by adding the subtotal, shipping fee, and tax fee
  final total = subtotalPrice + shippingFee + taxAmount;

  return total;
});

// --> Discount Provider
final discountedSubtotal = Provider<double>((ref) {
  final subtotalPrice = ref.watch(subtotalPriceProvider);

  final discount = ref.watch(discountProvider);

  final discountAmount = subtotalPrice * (discount / 100);
  final discountedSubtotal = subtotalPrice - discountAmount;
  return discountedSubtotal;
});
