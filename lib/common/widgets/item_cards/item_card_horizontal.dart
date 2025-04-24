import 'package:flutter/material.dart';
import 'package:invobay/common/widgets/text/item_price_with_icon.dart';
import 'package:invobay/common/widgets/text/item_quantity_text_with_icon.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';
import '../text/item_title_text_with_icon.dart';

class VItemCardHorizontal extends StatelessWidget {
  const VItemCardHorizontal({
    super.key,
    required this.itemName,
    required this.itemStock,
    required this.itemPrice,
    this.onTapItemDetails,
    this.stockIconColor = VColors.success,
    this.nameIconColor = VColors.kAccent,
  });

  final String itemName;
  final String itemStock;
  final String itemPrice;
  final VoidCallback? onTapItemDetails;
  final Color? stockIconColor;
  final Color nameIconColor;

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTapItemDetails,
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(VSizes.productImageRadius),
          color: isDark ? VColors.black : VColors.softGrey,
        ),
        child: Padding(
          padding: const EdgeInsets.all(VSizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VItemTitleTextWithIcon(
                title: itemName,
                smallSize: true,
                maxLines: 2,
                iconColor: nameIconColor,
              ),
              const SizedBox(height: VSizes.spaceBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: VItemQuantityTextWithIcon(
                    title: itemStock,
                    iconColor: stockIconColor,
                  )),

                  // price
                  VItemPriceTextWithIcon(
                    price: itemPrice,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
