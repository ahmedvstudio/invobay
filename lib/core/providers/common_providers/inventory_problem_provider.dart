import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../buy_providers/buy_receipt_details_provider.dart';
import '../item_providers/item_related_providers.dart';

final inventoryHasProblemProvider =
    AsyncNotifierProvider<InventoryProblemNotifier, bool>(
  () => InventoryProblemNotifier(),
);

class InventoryProblemNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    final items = ref.watch(itemNotifierProvider);
    if (items.isEmpty) return false;

    // For each item, get the list of receipts async
    for (final item in items) {
      final receiptsAsyncValue =
          await ref.read(receiptsDetailsProvider(item.id).future);

      final receipts = receiptsAsyncValue;
      final hasHighPriceReceipts =
          receipts.any((r) => r.itemPrice > item.buyingPrice);
      final isSellingBelowCost = item.sellingPrice <= item.buyingPrice;

      if (hasHighPriceReceipts || isSellingBelowCost) {
        return true; // Found problem
      }
    }

    return false; // No problem found
  }
}
