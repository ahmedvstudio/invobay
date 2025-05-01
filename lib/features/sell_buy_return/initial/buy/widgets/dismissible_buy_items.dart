import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/widgets/custom_shapes/dismissible/delete_background.dart';
import '../../../../../common/widgets/text/item_price_text.dart';
import '../../../../../core/models/buy_related_model/buy_model.dart';
import '../../../../../core/providers/buy_providers/buy_notifier.dart';
import '../../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../inventory/item_details/widgets/meta_data_section.dart';
import '../../../common/invoice_items.dart';
import '../../../common/item_quantity_with_edit.dart';

class DismissibleBuyItems extends ConsumerWidget {
  const DismissibleBuyItems({
    super.key,
    required this.buyItem,
    required this.buyNotifier,
    required this.isCheckout,
  });

  final BuyItem buyItem;
  final BuyNotifier buyNotifier;
  final bool isCheckout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(buyItem.item.id.toString()),
      direction:
          isCheckout ? DismissDirection.none : DismissDirection.endToStart,
      background: dismissDeleteBackground(),
      onDismissed: (direction) {
        _handleItemDismiss(context, buyItem, buyNotifier);
      },
      child: BuyItemDetails(buyItem: buyItem, isCheckout: isCheckout),
    );
  }

  /// Handles item dismissal with undo functionality
  void _handleItemDismiss(
      BuildContext context, BuyItem removedItem, BuyNotifier buyNotifier) {
    buyNotifier.removeItem(removedItem.item.id);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
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
            buyNotifier.addRemovedItem(removedItem);
          },
        ),
        backgroundColor: VColors.error,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

/// Displays details of a buy item
class BuyItemDetails extends ConsumerWidget {
  const BuyItemDetails({
    super.key,
    required this.buyItem,
    required this.isCheckout,
  });

  final BuyItem buyItem;
  final bool isCheckout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencySign = ref.watch(currencySignProvider);

    return Column(
      children: [
        VInvoiceItem(itemName: buyItem.item.name),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: VSizes.leftSideSpace,
                  child: VMetaDataSection(
                    tag: buyItem.item.itemUnit,
                    tagBackgroundColor: VColors.info,
                    tagTextColor: VColors.white,
                    showChild: false,
                    showIcon: false,
                    child: const Text(''),
                  ),
                ),
                if (!isCheckout)
                  VItemQuantityWithEdit(
                    quantity: buyItem.quantity,
                    buyingPrice: buyItem.price,
                    currencySign: currencySign,
                  ),
                if (isCheckout)
                  Text('${buyItem.quantity} × $currencySign${buyItem.price}',
                      style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            VItemPriceText(price: buyItem.price * buyItem.quantity),
          ],
        ),
      ],
    );
  }
}
