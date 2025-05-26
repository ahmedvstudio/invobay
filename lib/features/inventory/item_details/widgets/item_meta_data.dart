import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import '../../../../common/widgets/sheet/inventory/update_buying_price_sheet.dart';
import '../../../../common/widgets/sheet/inventory/update_selling_price_sheet.dart';
import '../../../../common/widgets/text/item_price_text.dart';
import '../../../../common/widgets/text/item_title_text.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../core/database/drift/app_database.dart';
import '../../../../core/providers/buy_providers/buy_receipt_details_provider.dart';
import '../../../../core/providers/item_providers/item_related_providers.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/low_stock_helper.dart';
import 'fix_button.dart';
import 'meta_data_section.dart';

class VItemMetaData extends ConsumerWidget {
  const VItemMetaData({
    super.key,
    required this.title,
    required this.stock,
    required this.sellingPrice,
    required this.buyingPrice,
    this.barcode,
    this.itemUnit,
  });

  final String title;
  final String stock;
  final double sellingPrice;
  final double buyingPrice;
  final String? barcode;
  final String? itemUnit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemProvider = ref.watch(itemNotifierProvider);
    final item = itemProvider.firstWhere((item) => item.name == title,
        orElse: () => Item(
              id: 0,
              name: title,
              quantity: 0.0,
              sellingPrice: 0.0,
              buyingPrice: 0.0,
              description: null,
              barcode: null,
              itemUnit: null,
            ));

    final lowStockColor = LowStockHelper(item.quantity, ref).getThreeColor();
    final lowStockText = LowStockHelper(item.quantity, ref).getThreeText();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        const VSectionHeading(title: 'Name:', showActionButton: false),
        const SizedBox(height: VSizes.spaceBtwItems),

        VItemTitleText(title: title, maxLines: 2, smallSize: true),
        const SizedBox(height: VSizes.spaceBtwItems),
        const Divider(),
        const SizedBox(height: VSizes.spaceBtwItems),

        // - Details
        const VSectionHeading(title: 'Details:', showActionButton: false),
        const SizedBox(height: VSizes.spaceBtwItems),

        // - In Stock
        Row(
          children: [
            Flexible(
              child: VMetaDataSection(
                tag: lowStockText,
                tagBackgroundColor: lowStockColor,
                tagTextColor: VColors.white,
                icon: Iconsax.box,
                child: Text(
                  VFormatters.formatPrice(item.quantity),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            VMetaDataSection(
              tag: itemUnit ?? '',
              tagBackgroundColor: VColors.info,
              tagTextColor: VColors.white,
              showChild: false,
              showIcon: false,
              child: const Text(''),
            ),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems),

        // - Buy Price
        Row(
          children: [
            Expanded(
              child: VMetaDataSection(
                tag: 'Buy Price',
                tagBackgroundColor: VColors.primary,
                tagTextColor: VColors.white,
                icon: Iconsax.shopping_cart,
                child: VItemPriceText(
                  price: buyingPrice,
                  isLarge: true,
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final receiptsAsync =
                    ref.watch(receiptsDetailsProvider(item.id));
                return receiptsAsync.when(
                  data: (receipts) {
                    final highPriceReceipts = receipts
                        .where((r) => r.itemPrice > item.buyingPrice)
                        .toList();
                    if (highPriceReceipts.isEmpty) {
                      return const SizedBox.shrink();
                    }

                    return VFixButton(
                      onTap: () {
                        showUpdateBuyingPriceBottomSheet(
                          context: context,
                          highPriceReceipts: highPriceReceipts,
                          currentBuyingPrice: item.buyingPrice,
                          onUpdate: (newBuyingPrice) {
                            ref
                                .read(itemNotifierProvider.notifier)
                                .updateBuyingPrice(item.id, newBuyingPrice);
                          },
                        );
                      },
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stack) => Text('Error: $error'),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        // selling
        VMetaDataSection(
          tag: 'Sell Price',
          icon: Iconsax.tag,
          tagBackgroundColor: VColors.primary,
          tagTextColor: VColors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VItemPriceText(
                price: sellingPrice,
                isLarge: true,
              ),
              if (item.sellingPrice <= item.buyingPrice)
                VFixButton(
                  onTap: () async {
                    await showUpdateSellingPriceBottomSheet(
                      context: context,
                      currentSellingPrice: item.sellingPrice,
                      buyingPrice: buyingPrice,
                      onUpdate: (newSellingPrice) {
                        ref
                            .read(itemNotifierProvider.notifier)
                            .updateSellingPrice(item.id, newSellingPrice);
                      },
                    );
                  },
                ),
            ],
          ),
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        VMetaDataSection(
          tag: 'Barcode',
          tagBackgroundColor: VColors.kAccent,
          tagTextColor: VColors.black,
          icon: Iconsax.barcode,
          child:
              Text(barcode ?? '', style: Theme.of(context).textTheme.bodyLarge),
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        Row(
          children: [
            const Expanded(
              child: VMetaDataSection(
                tag: 'Receipts & Suppliers',
                tagBackgroundColor: VColors.kAccent,
                tagTextColor: VColors.black,
                icon: Iconsax.receipt_item,
                showChild: false,
                child: Text('data'),
              ),
            ),
            VMetaDataSection(
              onTap: () => context.pushNamed(
                VRouter.itemBuyReceipts,
                pathParameters: {'id': item.id.toString()},
                extra: {'title': title},
              ),
              tag: 'More',
              tagBackgroundColor: VColors.info,
              tagTextColor: VColors.white,
              showChild: false,
              showIcon: true,
              icon: Icons.arrow_right,
              child: const Text(''),
            ),
          ],
        ),
      ],
    );
  }
}
