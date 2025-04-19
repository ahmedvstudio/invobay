import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/buy_related_model/buy_model.dart';
import '../../models/sell_related_model/sell_model.dart';
import '../common_providers/default_providers.dart';

// --> Update Subtotal
void updateSubtotal(WidgetRef ref, double newSubtotal) {
  ref.read(subtotalPriceProvider.notifier).state = newSubtotal;
}

// --> Calculate Sell Total Price
double calculateSellTotalPrice(WidgetRef ref, List<SellItem> sellItems) {
  double total = 0;
  for (var sellItem in sellItems) {
    total += sellItem.item.sellingPrice * sellItem.quantity;
  }
  // Update subtotal provider
  updateSubtotal(ref, total);
  return total;
}

// --> Calculate Buy Total Price
double calculateBuyTotalPrice(WidgetRef ref, List<BuyItem> buyItems) {
  double total = 0;
  for (var buyItem in buyItems) {
    total += buyItem.item.buyingPrice * buyItem.quantity;
  }
  // Update subtotal provider
  updateSubtotal(ref, total);
  return total;
}

// --> Discount Provider
final discountedSubtotal = Provider<double>((ref) {
  final subtotalPrice = ref.watch(subtotalPriceProvider);

  final discount = ref.watch(discountProvider);

  final discountAmount = subtotalPrice * (discount / 100);
  final discountedSubtotal = subtotalPrice - discountAmount;
  return discountedSubtotal;
});
