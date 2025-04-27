import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/database/drift/app_database.dart';
import 'package:invobay/core/repository/item_dao.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import '../../models/buy_related_model/buy_model.dart';
import '../../utils/constants/numbers.dart';
import '../common_providers/default_providers.dart';

class BuyNotifier extends StateNotifier<List<BuyItem>> {
  final Ref ref;
  final ItemDao itemDao;

  BuyNotifier(this.ref, this.itemDao) : super([]);

  // Updates subtotal price
  void updateSubtotal() {
    double newSubtotal =
        state.fold(0, (sum, item) => sum + (item.price * item.quantity));
    ref.read(subtotalPriceProvider.notifier).state = newSubtotal;
  }

  // Adds an item to the cart with stock validation

  Future<void> addItem(Item item) async {
    int existingIndex =
        state.indexWhere((buyItem) => buyItem.item.id == item.id);
    final fetchedItem = await itemDao.getItemById(item.id);
    if (fetchedItem == null) {
      debugPrint("Item not found in the inventory.");
      return;
    }

    double minStep = VNumbers.minStepAdd;

    if (existingIndex != -1) {
      // If the item already exists in the cart, increment its quantity by minStep
      BuyItem existingItem = state[existingIndex];
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == existingIndex)
            existingItem.copyWith(quantity: existingItem.quantity + minStep)
          else
            state[i]
      ];
    } else {
      // If the item is not in the cart, add it with the initial quantity of minStep
      state = [
        ...state,
        BuyItem(item: item, quantity: minStep, price: item.buyingPrice)
      ];
    }

    updateSubtotal(); // Update subtotal after adding
  }

  // Adds a removed item back to the cart
  Future<void> addRemovedItem(BuyItem removedItem) async {
    final fetchedItem = await itemDao.getItemById(removedItem.item.id);
    if (fetchedItem == null) {
      debugPrint("Item not found in the inventory.");
      return;
    }

    // Update buying price if necessary
    if (removedItem.price > fetchedItem.buyingPrice) {
      await itemDao.updateBuyingPrice(removedItem.item.id, removedItem.price);
    }

    int existingIndex =
        state.indexWhere((buyItem) => buyItem.item.id == removedItem.item.id);

    if (existingIndex != -1) {
      BuyItem existingItem = state[existingIndex];
      double newQuantity = existingItem.quantity + removedItem.quantity;

      state = [
        for (int i = 0; i < state.length; i++)
          if (i == existingIndex)
            existingItem.copyWith(quantity: newQuantity)
          else
            state[i]
      ];
    } else {
      state = [
        ...state,
        BuyItem(
            item: removedItem.item,
            quantity: removedItem.quantity,
            price: removedItem.price)
      ];
    }

    updateSubtotal(); // Update subtotal after adding
  }

  // Adds an item by searching for a match
  Future<void> addItemBySearch(String query) async {
    final searchResults = await itemDao.searchItems(query);
    if (searchResults.isNotEmpty) {
      searchResults.sort((a, b) => b.quantity.compareTo(a.quantity));
      await addItem(searchResults.first);
    } else {
      debugPrint("No items found matching the query.");
    }
  }

  // Removes an item from the cart
  void removeItem(int? itemId) {
    state = state.where((buyItem) => buyItem.item.id != itemId).toList();
    updateSubtotal(); // Update subtotal after removing
  }

// Updates only the BuyItem quantity and price, does not touch Item.buyingPrice
  Future<void> updateQuantityAndPrice(
    int itemId,
    double newQuantity,
    BuildContext context, [
    double? newBuyPrice,
  ]) async {
    if (newQuantity > 0) {
      state = state.map((buyItem) {
        if (buyItem.item.id == itemId) {
          return buyItem.copyWith(
            quantity: newQuantity,
            price: newBuyPrice ?? buyItem.price, // override if provided
          );
        }
        return buyItem;
      }).toList();
    } else {
      if (!context.mounted) return;
      VHelperFunctions.showSnackBar(
        context: context,
        message: "Quantity must be greater than 0",
        showCloseIcon: true,
      );
    }

    updateSubtotal();
  }

  ///
  // In BuyNotifier
  void addTemporaryNewItem({
    required String name,
    required double buyingPrice,
    double sellingPrice = 0,
    double quantity = 1,
    String? unit,
  }) {
    final tempItem = Item(
      id: -DateTime.now().millisecondsSinceEpoch, // negative temp id
      name: name,
      buyingPrice: buyingPrice,
      sellingPrice: sellingPrice,
      quantity: 0, // Inventory has 0 quantity for now
      itemUnit: unit ?? 'Piece',
      barcode: null, // optional
      description: null, // optional
    );

    state = [
      ...state,
      BuyItem(item: tempItem, quantity: quantity, price: buyingPrice),
    ];

    updateSubtotal();
  }

  ///

  // Clears the cart
  void clearCart() {
    state = [];
    updateSubtotal(); // Reset subtotal after clearing cart
  }
}
