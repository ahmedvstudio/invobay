import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/models/sell_related_model/sell_model.dart';

import '../../repository/sell_receipt_dao.dart';
import '../../services/notification/notification_types/checkout_notifications.dart';
import '../item_providers/item_related_providers.dart';
import 'sell_related_providers.dart';

class SellCheckoutNotifier {
  final SellReceiptDao sellReceiptDao;

  SellCheckoutNotifier(this.sellReceiptDao);

  Future<void> checkout({
    required List<SellItem> soldItems,
    required double subTotalPrice,
    required double totalPrice,
    required double discount,
    required double shippingFee,
    required double taxFee,
    required String paymentMethod,
    required String paymentStatus,
    required String discountType,
    required double amountPaid,
    required double amountDebt,
    int? customerId,
    required WidgetRef ref,
  }) async {
    final itemDao = ref.read(itemDaoProvider);
    final itemNotifier = ref.read(itemNotifierProvider.notifier);
    final sellNotifier = ref.read(sellNotifierProvider.notifier);

    // Save receipt first
    await sellReceiptDao.saveSellReceipt(
      soldItems: soldItems,
      subTotalPrice: subTotalPrice,
      discount: discount,
      shippingFee: shippingFee,
      taxFee: taxFee,
      paymentMethod: paymentMethod,
      customerId: customerId,
      amountPaid: amountPaid,
      amountDebt: amountDebt,
      paymentStatus: paymentStatus,
      totalPrice: totalPrice,
      discountType: discountType,
    );

    // Reduce stock quantity for each sold item
    for (final item in soldItems) {
      await itemDao.reduceStockQuantity(item.item.id, item.quantity);
      // Update the state after reducing the quantity
      await itemNotifier.fetchItems();
      sellNotifier.clearCart();
      // Show sell checkout notification with total price
      await showSellCheckoutNotification(totalPrice, ref);
    }
  }
}
