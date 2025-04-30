class ReceiptEditState {
  final bool isEditMode;
  final Set<String> selectedItems;

  const ReceiptEditState({
    this.isEditMode = false,
    this.selectedItems = const {},
  });

  ReceiptEditState copyWith({
    bool? isEditMode,
    Set<String>? selectedItems,
  }) {
    return ReceiptEditState(
      isEditMode: isEditMode ?? this.isEditMode,
      selectedItems: selectedItems ?? this.selectedItems,
    );
  }
}
