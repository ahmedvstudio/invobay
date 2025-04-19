import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/buy_related_model/buy_model.dart';
import '../../repository/buy_receipt_dao.dart';
import '../item_providers/item_related_providers.dart';
import 'buy_related_providers.dart';

class BuyCheckoutNotifier {
  final BuyReceiptDao buyReceiptDao;

  BuyCheckoutNotifier(this.buyReceiptDao);

  Future<void> checkout({
    required List<BuyItem> boughtItems,
    required double totalPrice,
    required double discount,
    required double shippingFee,
    required double taxFee,
    required String paymentMethod,
    required String paymentStatus,
    required double amountPaid,
    required double amountDebt,
    int? supplierId,
    required WidgetRef ref,
  }) async {
    final itemDao = ref.read(itemDaoProvider);
    final itemNotifier = ref.read(itemNotifierProvider.notifier);
    final buyNotifier = ref.read(buyNotifierProvider.notifier);
    // Save receipt first
    await buyReceiptDao.saveBuyReceipt(
      boughtItems: boughtItems,
      totalPrice: totalPrice,
      discount: discount,
      shippingFee: shippingFee,
      taxFee: taxFee,
      paymentMethod: paymentMethod,
      supplierId: supplierId,
      amountPaid: amountPaid,
      amountDebt: amountDebt,
      paymentStatus: paymentStatus,
    );

    // Reduce stock quantity for each boughtItems
    for (final item in boughtItems) {
      await itemDao.increaseStockQuantity(item.item.id, item.quantity);
      // Update the state after reducing the quantity
      await itemNotifier.fetchItems();
      buyNotifier.clearCart();
    }
  }
}
