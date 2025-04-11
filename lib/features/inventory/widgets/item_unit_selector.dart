import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/providers/item_providers/item_unit_notifier.dart';

import '../../../core/utils/constants/lists.dart';
import '../../../core/utils/validators/validation.dart';

class ItemUnitSelector extends ConsumerWidget {
  final TextEditingController itemUnitController;

  const ItemUnitSelector({
    super.key,
    required this.itemUnitController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItem = ref.watch(itemUnitProvider);
    if (itemUnitController.text.isEmpty &&
        selectedItem != null &&
        selectedItem.isNotEmpty) {
      itemUnitController.text = selectedItem;
    }

    void showDropdown(BuildContext context, WidgetRef ref) {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      final Offset offset = renderBox.localToGlobal(Offset.zero);

      showMenu(
        context: context,
        position: RelativeRect.fromLTRB(
          offset.dx,
          offset.dy + renderBox.size.height,
          offset.dx + renderBox.size.width,
          offset.dy + renderBox.size.height * 2,
        ),
        items: VLists.unitList.map((unit) {
          return PopupMenuItem<String>(
            value: unit,
            child: Text(unit),
          );
        }).toList(),
      ).then((selectedUnit) {
        if (selectedUnit != null) {
          ref.read(itemUnitProvider.notifier).selectItem(selectedUnit);
          itemUnitController.text = selectedUnit;
        }
      });
    }

    return Flexible(
      child: GestureDetector(
        onTap: () => showDropdown(context, ref),
        child: AbsorbPointer(
          child: TextFormField(
            controller: itemUnitController,
            decoration: const InputDecoration(
              labelText: 'Item Unit',
            ),
            validator: VValidator.validateEmpty,
          ),
        ),
      ),
    );
  }
}
