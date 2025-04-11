import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/widgets/text/item_price_text.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../item_details/widgets/meta_data_section.dart';
import '../../sell/widgets/sell_items.dart';

class VReceiptItem extends ConsumerWidget {
  const VReceiptItem({
    super.key,
    required this.itemName,
    required this.itemQuantity,
    required this.itemPrice,
    required this.currencySign,
    this.itemUnit,
  });

  final String itemName;
  final double itemQuantity;
  final double itemPrice;
  final String currencySign;
  final String? itemUnit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
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
    );
  }
}
