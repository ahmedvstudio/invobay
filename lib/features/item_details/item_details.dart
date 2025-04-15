import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:invobay/features/item_details/widgets/bottom_edits.dart';
import 'package:invobay/features/item_details/widgets/item_meta_data.dart';
import 'package:readmore/readmore.dart';

import '../../common/widgets/appbar/custom_appbar.dart';
import '../../common/widgets/dialogs/more_item_info_dialog.dart';
import '../../common/widgets/text/section_heading.dart';
import '../../core/providers/common_providers/default_providers.dart';
import '../../core/providers/item_providers/item_related_providers.dart';
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
    this.itemUnit,
  });

  final int itemId;
  final String title;
  final double stock;
  final double buyPrice;
  final double sellPrice;
  final String? supplierName;
  final String? description;
  final String? barcode;
  final String? itemUnit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencySign = ref.watch(currencySignProvider);

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
            VCustomAppBar(
              text: 'Item Details',
              actions: [
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return VMoreItemInfoDialog(
                            currencySign: currencySign,
                            buyPrice: buyPrice,
                            stock: stock,
                            sellPrice: sellPrice,
                          );
                        });
                  },
                  icon: const Icon(
                    Iconsax.information,
                    color: VColors.white,
                  ),
                )
              ],
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
                    stock: VFormatters.formatPrice(stock),
                    sellingPrice: sellPrice,
                    buyingPrice: buyPrice,
                    supplier: supplierName,
                    barcode: barcode,
                    itemUnit: itemUnit,
                  ),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  const VSectionHeading(
                      title: 'Description:', showActionButton: false),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  ReadMoreText(
                    description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w800),
                    lessStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w800),
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
