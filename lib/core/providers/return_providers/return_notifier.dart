import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/database/drift/app_database.dart';
import 'package:invobay/core/repository/item_dao.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import '../../models/return_related_model/return_model.dart';
import '../../utils/constants/numbers.dart';
import '../common_providers/default_providers.dart';

class ReturnNotifier extends StateNotifier<List<ReturnItem>> {
  final Ref ref;
  final ItemDao itemDao;

  ReturnNotifier(this.ref, this.itemDao) : super([]);

  // Updates subtotal price
  void updateSubtotal() {
    double newSubtotal = state.fold(
        0, (sum, item) => sum + (item.item.sellingPrice * item.quantity));
    ref.read(subtotalPriceProvider.notifier).state = newSubtotal;
  }

  // Adds an item to the cart with stock validation
  Future<void> addItem(Item item) async {
    int existingIndex =
        state.indexWhere((returnItem) => returnItem.item.id == item.id);
    final fetchedItem = await itemDao.getItemById(item.id);
    if (fetchedItem == null) {
      debugPrint("Item not found in the inventory.");
      return;
    }

    double availableStock = fetchedItem.quantity;
    double minStep = VNumbers.minStepAdd;

    if (existingIndex != -1) {
      ReturnItem existingItem = state[existingIndex];

      state = [
        for (int i = 0; i < state.length; i++)
          if (i == existingIndex)
            existingItem.copyWith(quantity: existingItem.quantity + minStep)
          else
            state[i]
      ];
    } else {
      if (availableStock >= minStep) {
        state = [...state, ReturnItem(item: item, quantity: minStep)];
      } else {
        VHelperFunctions.showToasty(
          backgroundColor: VColors.error,
          message: 'Item out of stock.',
        );
      }
    }

    updateSubtotal(); // Update subtotal after adding
  }

  // Adds a removed item back to the cart
  Future<void> addRemovedItem(ReturnItem removedItem) async {
    int existingIndex = state
        .indexWhere((returnItem) => returnItem.item.id == removedItem.item.id);

    if (existingIndex != -1) {
      // If the item already exists, update the quantity
      ReturnItem existingItem = state[existingIndex];
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
        ReturnItem(item: removedItem.item, quantity: removedItem.quantity)
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
    state = state.where((returnItem) => returnItem.item.id != itemId).toList();
    updateSubtotal(); // Update subtotal after removing
  }

  // Updates the quantity of an item with validation
  Future<void> updateQuantity(
      int itemId, double newQuantity, BuildContext context) async {
    final fetchedItem = await itemDao.getItemById(itemId);
    if (fetchedItem == null) {
      if (!context.mounted) return;
      VHelperFunctions.showSnackBar(
        context: context,
        message: "Item not found in the inventory.",
      );
      return;
    }

    double availableStock = fetchedItem.quantity;

    if (newQuantity > 0) {
      state = state.map((returnItem) {
        return returnItem.item.id == itemId
            ? returnItem.copyWith(quantity: newQuantity)
            : returnItem;
      }).toList();
    } else {
      if (!context.mounted) return;
      VHelperFunctions.showSnackBar(
        context: context,
        message: '${fetchedItem.name}\n In stock: $availableStock',
        showCloseIcon: true,
      );
    }

    updateSubtotal(); // Update subtotal after quantity change
  }

  // Clears the cart
  void clearCart() {
    state = [];
    updateSubtotal(); // Reset subtotal after clearing cart
  }
}
