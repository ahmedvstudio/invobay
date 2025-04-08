import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/models/sell_model.dart';

import '../../repository/sell_receipt_dao.dart';
import '../db_notifiers/app_providers.dart';

class SellCheckoutNotifier {
  final SellReceiptDao sellReceiptDao;

  SellCheckoutNotifier(this.sellReceiptDao);

  Future<void> checkout({
    required List<SellItem> soldItems,
    required double totalPrice,
    required double discount,
    required double shippingFee,
    required double taxFee,
    required String paymentMethod,
    int? customerId,
    required WidgetRef ref, // Add ref to access providers
  }) async {
    final itemDao = ref.read(itemDaoProvider); // Get itemDao to update stock
    final itemNotifier =
        ref.read(itemNotifierProvider.notifier); // Get the ItemNotifier
    final sellNotifier = ref.read(sellNotifierProvider.notifier);
    // Save receipt first
    await sellReceiptDao.saveSellReceipt(
      soldItems: soldItems,
      totalPrice: totalPrice,
      discount: discount,
      shippingFee: shippingFee,
      taxFee: taxFee,
      paymentMethod: paymentMethod,
      customerId: customerId,
    );

    // Reduce stock quantity for each sold item
    for (final item in soldItems) {
      await itemDao.reduceStockQuantity(item.item.id, item.quantity);
      // Update the state after reducing the quantity
      await itemNotifier.fetchItems();
      sellNotifier.clearCart();
    }
  }
}
