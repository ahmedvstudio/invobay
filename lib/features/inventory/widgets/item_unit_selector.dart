import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/providers/item_providers/item_unit_notifier.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/lists.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/validators/validation.dart';

class ItemUnitSelector extends ConsumerWidget {
  final TextEditingController itemUnitController;
  const ItemUnitSelector({
    super.key,
    required this.itemUnitController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = VHelperFunctions.isDarkMode(context);
    final selectedItem = ref.watch(itemUnitProvider);
    if (itemUnitController.text.isEmpty &&
        selectedItem != null &&
        selectedItem.isNotEmpty) {
      itemUnitController.text =
          VHelperFunctions.getUnitLabel(context, selectedItem);
    }

    void showDropdown(BuildContext context, WidgetRef ref) {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      final Offset offset = renderBox.localToGlobal(Offset.zero);

      showMenu(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(VSizes.borderRadiusMd)),
        color: isDark ? VColors.darkerGrey : VColors.grey,
        position: RelativeRect.fromLTRB(
          offset.dx,
          offset.dy + renderBox.size.height,
          offset.dx + renderBox.size.width,
          offset.dy + renderBox.size.height * 2,
        ),
        items: VLists.unitList.map((unit) {
          return PopupMenuItem<String>(
            value: unit,
            child: Text(VHelperFunctions.getUnitLabel(context, unit)),
          );
        }).toList(),
      ).then((selectedUnit) {
        if (selectedUnit != null) {
          ref.read(itemUnitProvider.notifier).selectItem(selectedUnit);
          if (!context.mounted) return;
          itemUnitController.text =
              VHelperFunctions.getUnitLabel(context, selectedUnit);
        }
      });
    }

    return Flexible(
      child: GestureDetector(
        onTap: () => showDropdown(context, ref),
        child: AbsorbPointer(
          child: TextFormField(
            controller: itemUnitController,
            decoration: InputDecoration(
              labelText: context.loc.itemUnit,
            ),
       validator: (value) =>
                          VValidator.validateEmpty(context, value),          ),
        ),
      ),
    );
  }
}
