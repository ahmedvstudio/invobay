import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'discount_provider.dart';

final subtotalPriceProvider = StateProvider<double>((ref) => 0.0);

void updateSubtotal(WidgetRef ref, double newSubtotal) {
  ref.read(subtotalPriceProvider.notifier).state = newSubtotal;
}

final discountedSubtotal = Provider<double>((ref) {
  final subtotalPrice = ref.watch(subtotalPriceProvider);

  final discount = ref.watch(discountProvider);

  final discountAmount = subtotalPrice * (discount / 100);
  final discountedSubtotal = subtotalPrice - discountAmount;
  return discountedSubtotal;
});
