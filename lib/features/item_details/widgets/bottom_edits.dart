import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/icons/circular_icon.dart';
import '../../../common/widgets/icons/circular_icon_with_conformation.dart';
import '../../../core/providers/item_provider.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';

class VBottomEdits extends StatelessWidget {
  final Function(BuildContext, int) onEdit;
  final int itemId;

  const VBottomEdits({
    super.key,
    required this.onEdit,
    required this.itemId,
  });

  void _deleteItem(BuildContext context, int itemId) {
    final provider = Provider.of<ItemProvider>(context, listen: false);
    provider.deleteItem(itemId);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: VSizes.defaultSpace, vertical: VSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: isDark ? VColors.darkerGrey : VColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(VSizes.cardRadiusLg),
          topRight: Radius.circular(VSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              VCircularIconWithConfirmation(
                onPressed: () => _deleteItem(context, itemId),
                icon: Iconsax.trash,
                backgroundColor: VColors.error,
                width: 40,
                height: 40,
                color: VColors.white,
              ),
              const SizedBox(width: VSizes.spaceBtwItems),
              VCircularIcon(
                onPressed: () => _showQuantityDialog(context, itemId),
                icon: Iconsax.add,
                backgroundColor: VColors.black,
                width: 40,
                height: 40,
                color: VColors.white,
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () => onEdit(context, itemId),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(VSizes.md),
              backgroundColor: VColors.black,
              side: const BorderSide(color: VColors.black),
            ),
            label: const Text('Edit'),
            icon: const Icon(Iconsax.edit),
          )
        ],
      ),
    );
  }
}

void _showQuantityDialog(BuildContext context, int itemId) {
  final TextEditingController quantityController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Add Quantity'),
      content: TextField(
        controller: quantityController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: 'Enter quantity',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final quantity = int.tryParse(quantityController.text) ?? 0;
            if (quantity > 0) {
              final provider =
                  Provider.of<ItemProvider>(context, listen: false);
              provider.addQuantity(itemId, quantity);
            }
            context.pop(); // Close the dialog
          },
          child: const Text('Add'),
        ),
      ],
    ),
  );
}
