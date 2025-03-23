import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/database/app_database.dart';
import 'package:invobay/core/repository/item_dao.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import '../models/sell_model.dart';
import '../utils/constants/numbers.dart';
import 'app_providers.dart';

final sellProvider = StateNotifierProvider<SellNotifier, List<SellItem>>((ref) {
  final itemDao = ref.read(itemDaoProvider);
  return SellNotifier(itemDao);
});

class SellNotifier extends StateNotifier<List<SellItem>> {
  final ItemDao itemDao;

  SellNotifier(this.itemDao) : super([]);

  // Adds an item to the cart with stock validation
  Future<void> addItem(Item item) async {
    final existingItem = state.firstWhere(
      (sellItem) => sellItem.item.id == item.id,
      orElse: () => SellItem(item: item, quantity: -1), // Mark as non-existent
    );

    final fetchedItem = await itemDao.getItemById(item.id);
    if (fetchedItem == null) {
      print("Item not found in the inventory.");
      return;
    }

    double availableStock = fetchedItem.quantity;
    double minStep =
        VNumbers.minStepAdd; // Adjust based on your inventory system

    if (existingItem.quantity != -1) {
      // Item already in cart, try to increase quantity by minStep
      if (existingItem.quantity + minStep <= availableStock) {
        state = state.map((sellItem) {
          return sellItem.item.id == item.id
              ? sellItem.copyWith(quantity: sellItem.quantity + minStep)
              : sellItem;
        }).toList();
      } else {
        VHelperFunctions.showToasty(
          backgroundColor: VColors.warning,
          message:
              "Quantity exceeds available stock. Current: ${existingItem.quantity}, Available: $availableStock",
        );
      }
    } else {
      // New item, check if there's stock available
      if (availableStock >= minStep) {
        state = [...state, SellItem(item: item, quantity: minStep)];
      } else {
        VHelperFunctions.showToasty(
          backgroundColor: VColors.error,
          message: 'Item out of stock.',
        );
      }
    }
  }

  // Adds an item by searching (fixing type issues)
  Future<void> addItemBySearch(String query) async {
    final searchResults = await itemDao.searchItems(query);
    if (searchResults.isNotEmpty) {
      await addItem(searchResults.first);
    } else {
      print("No items found matching the query.");
    }
  }

  // Removes an item from the cart by ID
  void removeItem(int itemId) {
    state = state.where((sellItem) => sellItem.item.id != itemId).toList();
  }

  // Updates the quantity of an item
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

    if (newQuantity <= availableStock && newQuantity > 0) {
      state = state.map((sellItem) {
        return sellItem.item.id == itemId
            ? sellItem.copyWith(quantity: newQuantity)
            : sellItem;
      }).toList();
    } else {
      if (!context.mounted) return;
      VHelperFunctions.showSnackBar(
        context: context,
        message: '${fetchedItem.name}\n In stock: $availableStock',
        showCloseIcon: true,
      );
    }
  }

  // Clears the cart
  void clearCart() {
    state = [];
  }
}
