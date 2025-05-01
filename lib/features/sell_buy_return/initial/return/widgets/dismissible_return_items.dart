import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/features/sell_buy_return/common/invoice_items.dart';

import '../../../../../common/widgets/custom_shapes/dismissible/delete_background.dart';
import '../../../../../common/widgets/text/item_price_text.dart';
import '../../../../../core/models/return_related_model/return_model.dart';
import '../../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../../core/providers/return_providers/return_notifier.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../inventory/item_details/widgets/meta_data_section.dart';
import '../../../common/item_quantity_with_edit.dart';

class DismissibleReturnItems extends ConsumerWidget {
  const DismissibleReturnItems({
    super.key,
    required this.returnItem,
    required this.returnNotifier,
    required this.isCheckout,
  });

  final ReturnItem returnItem;
  final ReturnNotifier returnNotifier;
  final bool isCheckout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(returnItem.item.id.toString()),
      direction:
          isCheckout ? DismissDirection.none : DismissDirection.endToStart,
      background: dismissDeleteBackground(),
      onDismissed: (direction) {
        _handleItemDismiss(context, returnItem, returnNotifier);
      },
      child: ReturnItemDetails(returnItem: returnItem, isCheckout: isCheckout),
    );
  }

  /// Handles item dismissal with undo functionality
  void _handleItemDismiss(BuildContext context, ReturnItem removedItem,
      ReturnNotifier returnNotifier) {
    returnNotifier.removeItem(removedItem.item.id);
    ScaffoldMessenger.of(context).clearSnackBars();
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
            returnNotifier.addRemovedItem(removedItem);
          },
        ),
        backgroundColor: VColors.error,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

/// Displays details of a return item
class ReturnItemDetails extends ConsumerWidget {
  const ReturnItemDetails({
    super.key,
    required this.returnItem,
    required this.isCheckout,
  });

  final ReturnItem returnItem;
  final bool isCheckout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencySign = ref.watch(currencySignProvider);

    return Column(
      children: [
        VInvoiceItem(itemName: returnItem.item.name),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: VSizes.leftSideSpace,
                  child: VMetaDataSection(
                    tag: returnItem.item.itemUnit,
                    tagBackgroundColor: VColors.info,
                    tagTextColor: VColors.white,
                    showChild: false,
                    showIcon: false,
                    child: const Text(''),
                  ),
                ),
                if (!isCheckout)
                  VItemQuantityWithEdit(
                    quantity: returnItem.quantity,
                    buyingPrice: returnItem.item.sellingPrice,
                    currencySign: currencySign,
                  ),
                if (isCheckout)
                  Text(
                      '${returnItem.quantity} × $currencySign${returnItem.item.sellingPrice}',
                      style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            VItemPriceText(
                price: returnItem.item.sellingPrice * returnItem.quantity),
          ],
        ),
      ],
    );
  }
}
