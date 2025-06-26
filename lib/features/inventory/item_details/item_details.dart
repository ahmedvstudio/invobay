import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/common/widgets/appbar/custom_appbar.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:invobay/features/inventory/item_details/widgets/bottom_edits.dart';
import 'package:invobay/features/inventory/item_details/widgets/item_meta_data.dart';
import 'package:readmore/readmore.dart';

import '../../../common/widgets/sheet/inventory/more_info_sheet.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../core/providers/item_providers/item_related_providers.dart';
import '../../../core/router/router_constant.dart';
import '../../../core/utils/constants/sizes.dart';

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
    required this.itemUnit,
  });

  final int itemId;
  final String title;
  final double stock;
  final double buyPrice;
  final double sellPrice;
  final String? description;
  final String? barcode;
  final String itemUnit;

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
              text: context.loc.itemDetails,
              actions: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(VSizes.spaceBtwItems)),
                      ),
                      isScrollControlled: true,
                      builder: (_) => MoreItemInfoSheet(
                        currencySign: currencySign,
                        buyPrice: buyPrice,
                        sellPrice: sellPrice,
                        stock: stock,
                      ),
                    );
                  },
                  icon: const Icon(
                    Iconsax.info_circle,
                    color: VColors.white,
                  ),
                )
              ],
            ),
            Padding(
              padding: VSpacingStyle.withoutTop,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VItemMetaData(
                    title: title,
                    stock: VFormatters.formatPrice(stock),
                    sellingPrice: sellPrice,
                    buyingPrice: buyPrice,
                    barcode: barcode,
                    itemUnit: itemUnit,
                  ),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  VSectionHeading(
                      title: '${context.loc.description}:',
                      showActionButton: false),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  ReadMoreText(
                    description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' ${context.loc.showMore}',
                    trimExpandedText: ' ${context.loc.less}',
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
