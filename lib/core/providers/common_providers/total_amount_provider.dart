import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/utils/messages/toast.dart';

import '../../utils/constants/enums.dart';
import '../db_providers/hive_providers/app_settings_provider.dart';
import 'default_providers.dart';

final totalAmountProvider = Provider<double>((ref) {
  final subtotalPrice = ref.watch(subtotalPriceProvider);
  final shippingFee = ref.watch(shippingFeeProvider);
  final discount = ref.watch(discountProvider);
  final discountType = ref.watch(discountTypeProvider);
  final taxFee = ref.watch(taxFeeProvider);

  // Step 1: Calculate Discount Amount
  double discountAmount = 0;
  if (discountType == DiscountType.percentage) {
    discountAmount = subtotalPrice * (discount / 100);
  } else if (discountType == DiscountType.amount) {
    discountAmount = discount;
  }

  // Ensure discount doesn't exceed subtotal
  if (discountAmount > subtotalPrice) {
    VToast.warning(message: 'Discount amount exceeds subtotal.');
  }

  // Step 2: Apply Discount
  final discountedSubtotal = subtotalPrice - discountAmount;

  // Step 3: Apply Tax
  final taxedAmount = discountedSubtotal * (taxFee / 100);

  // Step 4: Calculate Final Total
  final total = discountedSubtotal + shippingFee + taxedAmount;

  return double.parse(total.toStringAsFixed(2));
});
