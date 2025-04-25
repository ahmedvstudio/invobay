import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../db_providers/hive_providers/app_settings_provider.dart';
import 'default_providers.dart';

final totalAmountProvider = Provider<double>((ref) {
  final subtotalPrice = ref.watch(subtotalPriceProvider);
  final shippingFee = ref.watch(shippingFeeProvider);
  final discount = ref.watch(discountProvider);
  final taxFee = ref.watch(taxFeeProvider);

  // Calculate Discount
  final discountAmount = subtotalPrice * (discount / 100);
  final discountedSubtotal = subtotalPrice - discountAmount;
  // Calculate Tax
  final taxedAmount = subtotalPrice * (taxFee / 100);

  // Calculate the total amount by adding the subtotal, shipping fee, and tax fee
  final total = discountedSubtotal + shippingFee + taxedAmount;

  return total;
});
