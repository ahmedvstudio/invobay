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
    required double subTotalPrice,
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

    // Step 1: Insert temporary items into inventory first
    List<BuyItem> updatedBoughtItems = [];

    for (final item in boughtItems) {
      if (item.item.id.isNegative) {
        // Temporary item -> insert into inventory
        final newItemId = await itemDao.insertNewItem(
          name: item.item.name,
          buyingPrice: item.item.buyingPrice,
          sellingPrice: item.item.sellingPrice,
          quantity: item.quantity,
          unit: item.item.itemUnit ?? 'Piece',
          barcode: '',
          description: '',
        );

        updatedBoughtItems.add(
          BuyItem(
            item: item.item.copyWith(id: newItemId),
            quantity: item.quantity,
            price: item.price,
          ),
        );
      } else {
        updatedBoughtItems.add(item);
      }
    }

    // Step 2: Save receipt with updatedBoughtItems
    await buyReceiptDao.saveBuyReceipt(
      boughtItems: updatedBoughtItems,
      subTotalPrice: subTotalPrice,
      discount: discount,
      shippingFee: shippingFee,
      taxFee: taxFee,
      paymentMethod: paymentMethod,
      supplierId: supplierId,
      amountPaid: amountPaid,
      amountDebt: amountDebt,
      paymentStatus: paymentStatus,
      totalPrice: totalPrice,
    );

    // Step 3: Increase stock quantities for existing items
    for (final item in updatedBoughtItems) {
      await itemDao.increaseStockQuantity(item.item.id, item.quantity);
    }

    // Step 4: Refresh UI
    await itemNotifier.fetchItems();
    buyNotifier.clearCart();
  }
}
