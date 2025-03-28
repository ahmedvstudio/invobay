import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/providers/sell_related_providers/update_subtotal_provider.dart';
import '../default_providers.dart';

final totalAmountProvider = Provider<double>((ref) {
  final subtotalPrice = ref.watch(discountedSubtotal);
  final shippingFee = ref.watch(shippingFeeProvider);
  final taxFee = ref.watch(taxFeeProvider);

  final total = subtotalPrice + shippingFee + taxFee;

  return total;
});
