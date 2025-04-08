import 'package:flutter/material.dart';

import '../../../common/widgets/custom_shapes/dismissible/delete_background.dart';
import '../../../common/widgets/custom_shapes/dismissible/return_background.dart';
import '../../../common/widgets/text/item_price_text.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../item_details/widgets/meta_data_section.dart';
import '../../sell/widgets/sell_items.dart';

class VDismissibleReceiptItem extends StatelessWidget {
  const VDismissibleReceiptItem({
    super.key,
    required this.dismissKey,
    required this.itemName,
    required this.itemQuantity,
    required this.itemPrice,
    required this.currencySign,
    this.itemUnit,
  });

  final Key dismissKey;
  final String itemName;
  final double itemQuantity;
  final double itemPrice;
  final String currencySign;
  final String? itemUnit;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: dismissKey,
      background: dismissReturnBackground(),
      secondaryBackground: dismissDeleteBackground(),
      onDismissed: (direction) async {
        if (direction == DismissDirection.endToStart) {
          /// TODO handle delete
        } else {
          // If not confirmed, you may want to show an undo snackbar or similar
          // You can also call setState if you are managing local state instead of providers
        }

        if (direction == DismissDirection.startToEnd) {
          /// TODO handle returns
        }
      },
      child: Column(
        children: [
          VSellItem(itemName: itemName),
          const SizedBox(height: VSizes.spaceBtwItems / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: VSizes.leftSideSpace,
                    child: VMetaDataSection(
                      tag: itemUnit,
                      tagBackgroundColor: VColors.info,
                      tagTextColor: VColors.white,
                      showChild: false,
                      showIcon: false,
                      child: const Text(''),
                    ),
                  ),
                  Text('$itemQuantity × $currencySign$itemPrice',
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
              VItemPriceText(price: itemQuantity * itemPrice),
            ],
          ),
        ],
      ),
    );
  }
}
