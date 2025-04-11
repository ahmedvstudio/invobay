import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier to manage the selected item
class ItemUnitNotifier extends StateNotifier<String?> {
  ItemUnitNotifier() : super(null);

  void selectItem(String item) {
    state = item;
  }
}

// Provider for the ItemUnitNotifier
final itemUnitProvider =
    StateNotifierProvider<ItemUnitNotifier, String?>((ref) {
  return ItemUnitNotifier();
});
