import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/text/brand_title_text_with_verification_icon.dart';
import '../../../common/widgets/text/item_price_text.dart';
import '../../../common/widgets/text/item_title_text.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/utils/constants/enums.dart';
import '../../../core/utils/constants/sizes.dart';
import 'meta_data_section.dart';

class VItemMetaData extends StatelessWidget {
  const VItemMetaData({
    super.key,
    required this.title,
    required this.stock,
    required this.sellingPrice,
    required this.buyingPrice,
    this.supplier,
    this.barcode,
  });

  final String title;
  final String stock;
  final String sellingPrice;
  final String buyingPrice;
  final String? supplier;
  final String? barcode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        const VSectionHeading(
          title: 'Name:',
          showActionButton: false,
          textUnderline: true,
        ),
        const SizedBox(height: VSizes.spaceBtwItems / 2),

        VItemTitleText(title: title, maxLines: 2),
        const SizedBox(height: VSizes.spaceBtwItems),
        const Divider(),
        const SizedBox(height: VSizes.spaceBtwItems),

        // - Details
        const VSectionHeading(
          title: 'Details:',
          showActionButton: false,
          textUnderline: true,
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        // - In Stock
        VMetaDataSection(
          tag: 'In Stock',
          icon: Iconsax.box,
          child: Text(stock, style: Theme.of(context).textTheme.titleMedium),
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        // - Buy Price
        VMetaDataSection(
          tag: 'Buy',
          icon: Iconsax.shopping_cart,
          child: VItemPriceText(
            price: buyingPrice,
            isLarge: true,
          ),
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        // selling
        VMetaDataSection(
          tag: 'Sell',
          icon: Iconsax.tag,
          child: VItemPriceText(
            price: sellingPrice,
            isLarge: true,
          ),
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        VMetaDataSection(
          tag: 'Barcode',
          icon: Iconsax.barcode,
          child: Text(
            barcode ?? 'Enter barcode',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(decoration: TextDecoration.underline, fontSize: 14),
          ),
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        VMetaDataSection(
          showTag: false,
          icon: Iconsax.user_tag,
          child: VBrandTitleTextWithVerificationIcon(
              title: supplier ?? 'Supplier', brandTextSizes: TextSizes.medium),
        ),
      ],
    );
  }
}
