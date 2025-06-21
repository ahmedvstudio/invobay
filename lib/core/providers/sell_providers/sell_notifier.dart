import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/database/drift/app_database.dart';
import 'package:invobay/core/repository/item_dao.dart';

import 'package:invobay/core/utils/messages/snackbar.dart';
import '../../models/sell_related_model/sell_model.dart';
import '../../utils/constants/numbers.dart';
import '../../utils/messages/toast.dart';
import '../common_providers/default_providers.dart';

class SellNotifier extends StateNotifier<List<SellItem>> {
  final Ref ref;
  final ItemDao itemDao;

  SellNotifier(this.ref, this.itemDao) : super([]);

  // Updates subtotal price
  void updateSubtotal() {
    double newSubtotal = state.fold(
        0, (sum, item) => sum + (item.item.sellingPrice * item.quantity));
    ref.read(subtotalPriceProvider.notifier).state = newSubtotal;
  }

  // Adds an item to the cart with stock validation
  Future<void> addItem(Item item) async {
    int existingIndex =
        state.indexWhere((sellItem) => sellItem.item.id == item.id);
    final fetchedItem = await itemDao.getItemById(item.id);
    if (fetchedItem == null) {
      debugPrint("Item not found in the inventory.");
      return;
    }

    double availableStock = fetchedItem.quantity;
    double minStep = VNumbers.minStepAdd;

    if (existingIndex != -1) {
      SellItem existingItem = state[existingIndex];
      if (existingItem.quantity + minStep <= availableStock) {
        state = [
          for (int i = 0; i < state.length; i++)
            if (i == existingIndex)
              existingItem.copyWith(quantity: existingItem.quantity + minStep)
            else
              state[i]
        ];
      } else {
        VToast.warning(
            message:
                "Quantity exceeds available stock. Current: ${existingItem.quantity}, Available: $availableStock");
      }
    } else {
      if (availableStock >= minStep) {
        state = [...state, SellItem(item: item, quantity: minStep)];
      } else {
        VToast.error(message: 'Item out of stock.');
      }
    }

    updateSubtotal(); // Update subtotal after adding
  }

  // Adds a removed item back to the cart
  Future<void> addRemovedItem(SellItem removedItem) async {
    int existingIndex =
        state.indexWhere((sellItem) => sellItem.item.id == removedItem.item.id);

    if (existingIndex != -1) {
      // If the item already exists, update the quantity
      SellItem existingItem = state[existingIndex];
      double newQuantity = existingItem.quantity + removedItem.quantity;

      state = [
        for (int i = 0; i < state.length; i++)
          if (i == existingIndex)
            existingItem.copyWith(quantity: newQuantity)
          else
            state[i]
      ];
    } else {
      // If the item is not in the state, add it
      state = [
        ...state,
        SellItem(item: removedItem.item, quantity: removedItem.quantity)
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
    state = state.where((sellItem) => sellItem.item.id != itemId).toList();
    updateSubtotal(); // Update subtotal after removing
  }

  // Updates the quantity of an item with validation
  Future<void> updateQuantity(
      int itemId, double newQuantity, BuildContext context) async {
    final fetchedItem = await itemDao.getItemById(itemId);
    if (fetchedItem == null) {
      if (!context.mounted) return;
      VSnackbar.error("Item not found in the inventory.");

      return;
    }

    double availableStock = fetchedItem.quantity;

    if (newQuantity > 0 && newQuantity <= availableStock) {
      state = state.map((sellItem) {
        return sellItem.item.id == itemId
            ? sellItem.copyWith(quantity: newQuantity)
            : sellItem;
      }).toList();
    } else {
      if (!context.mounted) return;
      VSnackbar.error('${fetchedItem.name}\n In stock: $availableStock');
    }

    updateSubtotal(); // Update subtotal after quantity change
  }

  // Clears the cart
  void clearCart() {
    state = [];
    updateSubtotal(); // Reset subtotal after clearing cart
  }
}
