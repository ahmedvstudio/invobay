import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/providers/return_providers/return_related_providers.dart';

import '../../models/return_related_model/return_model.dart';
import '../../repository/return_receipt_dao.dart';
import '../item_providers/item_related_providers.dart';

class ReturnCheckoutNotifier {
  final ReturnReceiptDao returnReceiptDao;

  ReturnCheckoutNotifier(this.returnReceiptDao);

  Future<void> checkout({
    required List<ReturnItem> returnedItems,
    required double subTotalPrice,
    required double totalPrice,
    required double discount,
    required double shippingFee,
    required double taxFee,
    required String paymentMethod,
    required String paymentStatus,
    required double amountPaid,
    required double amountDebt,
    required WidgetRef ref,
  }) async {
    final itemDao = ref.read(itemDaoProvider);
    final itemNotifier = ref.read(itemNotifierProvider.notifier);
    final returnNotifier = ref.read(returnNotifierProvider.notifier);
    // Save receipt first
    await returnReceiptDao.saveReturnReceipt(
      returnedItems: returnedItems,
      subTotalPrice: subTotalPrice,
      discount: discount,
      shippingFee: shippingFee,
      taxFee: taxFee,
      paymentMethod: paymentMethod,
      amountPaid: amountPaid,
      amountDebt: amountDebt,
      paymentStatus: paymentStatus,
      totalPrice: totalPrice,
    );

    // Reduce stock quantity for each sold item
    for (final item in returnedItems) {
      await itemDao.increaseStockQuantity(item.item.id, item.quantity);
      // Update the state after reducing the quantity
      await itemNotifier.fetchItems();
      returnNotifier.clearCart();
    }
  }
}
