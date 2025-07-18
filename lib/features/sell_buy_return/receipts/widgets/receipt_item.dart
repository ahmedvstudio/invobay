import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/text/item_price_text.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../inventory/item_details/widgets/meta_data_section.dart';
import '../../common/invoice_items.dart';

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
        VInvoiceItem(itemName: itemName),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                VMetaDataSection(
                  tag: VHelperFunctions.getUnitLabel(context, itemUnit ?? ''),
                  tagBackgroundColor: VColors.info,
                  tagTextColor: VColors.white,
                  showChild: false,
                  showIcon: false,
                  child: const Text(''),
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
