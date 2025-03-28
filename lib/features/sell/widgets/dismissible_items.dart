import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/features/sell/widgets/sell_items.dart';

import '../../../common/widgets/text/item_price_text.dart';
import '../../../core/models/sell_model.dart';
import '../../../core/providers/default_providers.dart';
import '../../../core/providers/db_notifiers/sell_notifier.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import 'item_quantity_with_edit.dart';

class DismissibleItems extends ConsumerWidget {
  const DismissibleItems({
    super.key,
    required this.sellItem,
    required this.sellNotifier,
    required this.isCheckout,
  });

  final SellItem sellItem;
  final SellNotifier sellNotifier;
  final bool isCheckout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(sellItem.item.id.toString()),
      direction:
          isCheckout ? DismissDirection.none : DismissDirection.endToStart,
      background: _buildDismissBackground(),
      onDismissed: (direction) {
        _handleItemDismiss(context, sellItem, sellNotifier);
      },
      child: SellItemDetails(sellItem: sellItem, isCheckout: isCheckout),
    );
  }

  /// Builds the background UI when swiping to delete
  Widget _buildDismissBackground() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(VSizes.borderRadiusMd),
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
    );
  }

  /// Handles item dismissal with undo functionality
  void _handleItemDismiss(
      BuildContext context, SellItem removedItem, SellNotifier sellNotifier) {
    sellNotifier.removeItem(removedItem.item.id);

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
            sellNotifier.addRemovedItem(removedItem);
          },
        ),
        backgroundColor: VColors.error,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

/// Displays details of a sell item
class SellItemDetails extends ConsumerWidget {
  const SellItemDetails({
    super.key,
    required this.sellItem,
    required this.isCheckout,
  });

  final SellItem sellItem;
  final bool isCheckout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencySign = ref.watch(currencySignProvider);

    return Column(
      children: [
        VSellItem(item: sellItem.item),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(width: VSizes.leftSideSpace),
                if (!isCheckout)
                  VItemQuantityWithEdit(quantity: sellItem.quantity),
                if (isCheckout)
                  Text(
                      '${sellItem.quantity} × $currencySign${sellItem.item.sellingPrice}',
                      style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            VItemPriceText(
                price: sellItem.item.sellingPrice * sellItem.quantity),
          ],
        ),
      ],
    );
  }
}
