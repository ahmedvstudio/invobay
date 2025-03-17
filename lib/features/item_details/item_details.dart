import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/features/item_details/widgets/bottom_edits.dart';
import 'package:invobay/features/item_details/widgets/item_meta_data.dart';
import 'package:readmore/readmore.dart';

import '../../common/widgets/appbar/custom_appbar.dart';
import '../../common/widgets/text/section_heading.dart';
import '../../core/providers/item_notifier_provider.dart';
import '../../core/router/router_constant.dart';
import '../../core/utils/constants/sizes.dart';

class ItemDetailsScreen extends ConsumerWidget {
  const ItemDetailsScreen({
    super.key,
    required this.itemId,
    required this.title,
    required this.stock,
    required this.buyPrice,
    required this.sellPrice,
    this.barcode,
    this.description,
    this.supplierName,
  });

  final int itemId;
  final String title;
  final int stock;
  final double buyPrice;
  final double sellPrice;
  final String? supplierName;
  final String? description;
  final String? barcode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: VBottomEdits(
        onEdit: (context, itemId) {
          context.pushNamed(VRouter.editItem,
              pathParameters: {'id': itemId.toString()});
        },
        itemId: itemId,
        onDelete: (context, itemId) {
          final notifier = ref.read(itemNotifierProvider.notifier);
          notifier.deleteItem(itemId);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const VCustomAppBar(
              text: 'Item Details',
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: VSizes.defaultSpace,
                  left: VSizes.defaultSpace,
                  bottom: VSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VItemMetaData(
                    title: title,
                    stock: stock.toString(),
                    sellingPrice: sellPrice.toString(),
                    buyingPrice: buyPrice.toString(),
                    supplier: supplierName,
                    barcode: barcode,
                  ),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  const VSectionHeading(
                    title: 'Description:',
                    showActionButton: false,
                    textUnderline: true,
                  ),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  ReadMoreText(
                    description!,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: VSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
