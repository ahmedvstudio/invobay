import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/widgets/text/brand_title_text_with_verification_icon.dart';
import '../../../common/widgets/text/item_price_text.dart';
import '../../../common/widgets/text/item_title_text.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/database/app_database.dart';
import '../../../core/providers/item_notifier_provider.dart'; // Ensure this import is included
import '../../../core/utils/constants/enums.dart';
import '../../../core/utils/constants/sizes.dart';
import 'meta_data_section.dart';

class VItemMetaData extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final itemProvider =
        ref.watch(itemNotifierProvider); // Access item data via Riverpod

    // Find the item based on title (name)
    final item = itemProvider.firstWhere((item) => item.name == title,
        orElse: () => Item(
            id: 0,
            name: title,
            quantity: 0,
            sellingPrice: 0.0,
            buyingPrice: 0.0,
            supplierName: null,
            description: null,
            barcode: null));

    final formattedQuantity = NumberFormat('#,###').format(item.quantity);

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
          child: Text(
            formattedQuantity,
            style: Theme.of(context).textTheme.titleMedium,
          ),
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
