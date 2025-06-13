import 'package:flutter/material.dart';
import 'package:invobay/common/widgets/text/item_price_with_icon.dart';
import 'package:invobay/common/widgets/text/item_quantity_text_with_icon.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/formatters/formatters.dart';
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
    this.isThereProblem = false,
  });

  final String itemName;
  final double itemStock;
  final String itemPrice;
  final VoidCallback? onTapItemDetails;
  final Color? stockIconColor;
  final bool isThereProblem;
  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTapItemDetails,
      child: Badge(
        offset: const Offset(-10, 5),
        backgroundColor: Colors.transparent,
        label:
            const Icon(Icons.info, color: VColors.error, size: VSizes.iconSm),
        isLabelVisible: isThereProblem,
        child: Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(VSizes.productImageRadius),
            color: isDark ? VColors.lightDarkerGrey : VColors.lightGrey,
          ),
          child: Padding(
            padding: const EdgeInsets.all(VSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VItemTitleTextWithIcon(
                  title: itemName,
                  smallSize: false,
                  maxLines: 2,
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: VItemQuantityTextWithIcon(
                      title: VFormatters.formatPrice(itemStock),
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
      ),
    );
  }
}
