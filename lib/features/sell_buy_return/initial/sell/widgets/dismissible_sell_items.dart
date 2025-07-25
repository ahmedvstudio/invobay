import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/features/sell_buy_return/common/invoice_items.dart';

import '../../../../../common/widgets/custom_shapes/dismissible/delete_background.dart';
import '../../../../../common/widgets/text/item_price_text.dart';
import '../../../../../core/models/sell_related_model/sell_model.dart';
import '../../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../../core/providers/sell_providers/sell_notifier.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../inventory/item_details/widgets/meta_data_section.dart';
import '../../../common/item_quantity_with_edit.dart';

class DismissibleSellItems extends ConsumerWidget {
  const DismissibleSellItems({
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
      background: dismissDeleteBackground(),
      onDismissed: (direction) {
        _handleItemDismiss(context, sellItem, sellNotifier);
      },
      child: SellItemDetails(sellItem: sellItem, isCheckout: isCheckout),
    );
  }

  /// Handles item dismissal with undo functionality
  void _handleItemDismiss(
      BuildContext context, SellItem removedItem, SellNotifier sellNotifier) {
    sellNotifier.removeItem(removedItem.item.id);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: VColors.white,
        dismissDirection: DismissDirection.down,
        content: Text(
          '${removedItem.item.name} ${context.loc.removed}',
          style: const TextStyle().apply(color: VColors.white),
        ),
        action: SnackBarAction(
          label: context.loc.undo,
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
        VInvoiceItem(itemName: sellItem.item.name),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                VMetaDataSection(
                  tag: sellItem.item.itemUnit,
                  tagBackgroundColor: VColors.info,
                  tagTextColor: VColors.white,
                  showChild: false,
                  showIcon: false,
                  child: const Text(''),
                ),
                if (!isCheckout)
                  VItemQuantityWithEdit(
                    quantity: sellItem.quantity,
                    buyingPrice: sellItem.item.sellingPrice,
                    currencySign: currencySign,
                  ),
                if (isCheckout)
                  Text(
                      '${sellItem.quantity} × $currencySign${sellItem.item.sellingPrice}',
                      style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            Flexible(
              child: VItemPriceText(
                  price: sellItem.item.sellingPrice * sellItem.quantity),
            ),
          ],
        ),
      ],
    );
  }
}
