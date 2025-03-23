import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/features/sell/widgets/sell_items.dart';

import '../../../common/widgets/dialogs/quantity_input_dialog.dart';
import '../../../common/widgets/text/item_price_text.dart';
import '../../../core/models/sell_model.dart';
import '../../../core/providers/quantity_provider.dart';
import '../../../core/providers/sell_provider.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/numbers.dart';
import '../../../core/utils/constants/sizes.dart';
import 'add_remove_buttons.dart';

class DismissibleItems extends ConsumerWidget {
  const DismissibleItems({
    super.key,
    required this.sellItem,
    required this.sellNotifier,
  });

  final SellItem sellItem;
  final SellNotifier sellNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(sellItem.item.id.toString()),
      direction: DismissDirection.endToStart,
      background: ClipRRect(
        borderRadius:
            BorderRadius.circular(VSizes.borderRadiusMd), // Rounded corners
        child: Container(
          decoration: BoxDecoration(
            color: VColors.error,
            borderRadius: BorderRadius.circular(VSizes.borderRadiusMd),
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace),
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 300),
            builder: (context, opacity, child) {
              return Opacity(opacity: opacity, child: child);
            },
            child: const Icon(Iconsax.trash,
                color: VColors.white, size: VSizes.iconLg),
          ),
        ),
      ),
      onDismissed: (direction) {
        final removedItem = sellItem;
        sellNotifier.removeItem(sellItem.item.id);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            showCloseIcon: true,
            closeIconColor: VColors.white,
            dismissDirection: DismissDirection.down,
            content: Text(
              '${removedItem.item.name} removed',
              style: const TextStyle().apply(color: VColors.white),
            ),
            action: SnackBarAction(
              label: 'Undo',
              textColor: VColors.white,
              onPressed: () {
                sellNotifier.addItem(removedItem.item);
              },
            ),
            backgroundColor: VColors.error,
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Column(
        children: [
          VSellItem(item: sellItem.item),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 50),
                  VItemQuantityWithAddRemove(
                    quantity: sellItem.quantity,
                    isPressed: false,
                    onAdd: () {
                      ref.read(sellProvider.notifier).updateQuantity(
                          sellItem.item.id,
                          sellItem.quantity + VNumbers.minStepAdd,
                          context);
                    },
                    onRemove: () {
                      if (sellItem.quantity > VNumbers.minStepAdd) {
                        ref.read(sellProvider.notifier).updateQuantity(
                            sellItem.item.id,
                            sellItem.quantity - VNumbers.minStepAdd,
                            context);
                      } else {
                        ref
                            .read(sellProvider.notifier)
                            .removeItem(sellItem.item.id);
                      }
                    },
                    onQuantityTap: () {
                      ref.read(quantityProvider.notifier).state =
                          sellItem.quantity.toString();
                      showDialog(
                        context: context,
                        builder: (context) => VQuantityInputDialog(
                          initialQuantity: sellItem.quantity,
                          itemId: sellItem.item.id,
                        ),
                      );
                    },
                  ),
                ],
              ),
              VItemPriceText(
                  price: sellItem.item.sellingPrice * sellItem.quantity),
            ],
          ),
        ],
      ),
    );
  }
}
