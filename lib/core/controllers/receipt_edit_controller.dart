import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/state_models/receipt_edit_model.dart';

class ReceiptEditController extends StateNotifier<ReceiptEditState> {
  ReceiptEditController() : super(const ReceiptEditState());

  void toggleEditMode() {
    state = state.copyWith(
      isEditMode: !state.isEditMode,
      selectedItems: {},
    );
  }

  void toggleSelection(String id) {
    final newSet = Set<String>.from(state.selectedItems);
    if (newSet.contains(id)) {
      newSet.remove(id);
    } else {
      newSet.add(id);
    }
    state = state.copyWith(selectedItems: newSet);
  }

  void clearSelection() {
    state = state.copyWith(selectedItems: {});
  }
}
