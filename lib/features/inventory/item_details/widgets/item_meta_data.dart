import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';

import '../../../../common/widgets/text/brand_title_text_with_verification_icon.dart';
import '../../../../common/widgets/text/item_price_text.dart';
import '../../../../common/widgets/text/item_title_text.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../core/database/drift/app_database.dart';
import '../../../../core/providers/item_providers/item_related_providers.dart';
import '../../../../core/providers/item_providers/receipt_with_item_provider.dart';
import '../../../../core/providers/supplier_providers/supplier_related_providers.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/low_stock_helper.dart';
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
    this.itemUnit,
  });

  final String title;
  final String stock;
  final double sellingPrice;
  final double buyingPrice;
  final String? supplier;
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
              supplierName: null,
              description: null,
              barcode: null,
              itemUnit: null,
            ));

    final lowStockColor = LowStockHelper(item.quantity).getThreeColor();
    final lowStockText = LowStockHelper(item.quantity).getThreeText();
    final receiptsAsync = ref.watch(receiptsWithItemProvider(item.id));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        const VSectionHeading(title: 'Name:', showActionButton: false),
        const SizedBox(height: VSizes.spaceBtwItems / 2),

        VItemTitleText(title: title, maxLines: 2),
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
          tagBackgroundColor: VColors.secondaryDark,
          tagTextColor: VColors.white,
          icon: Iconsax.barcode,
          child:
              Text(barcode ?? '', style: Theme.of(context).textTheme.bodyLarge),
        ),

        const SizedBox(height: VSizes.spaceBtwItems),
        VMetaDataSection(
          showTag: true,
          tag: 'Supplier',
          tagBackgroundColor: VColors.info,
          tagTextColor: VColors.white,
          icon: Iconsax.user_tag,
          child: receiptsAsync.when(
            data: (receipts) {
              if (receipts.isEmpty) {
                return const Text('No Supplier found.');
              }

              // Filter unique receipts by supplierId (exclude supplierId == 0)
              final uniqueReceiptsMap = <int, BuyReceiptsModel>{};
              for (var receipt in receipts) {
                if (receipt.supplierId != 0 && receipt.supplierId != null) {
                  uniqueReceiptsMap[receipt.supplierId!] = receipt;
                }
              }
              final uniqueReceipts = uniqueReceiptsMap.values.toList();

              return Wrap(
                spacing: 8,
                runSpacing: 4,
                children: uniqueReceipts.map((receipt) {
                  return Consumer(
                    builder: (context, ref, child) {
                      final supplierAsync =
                          ref.watch(supplierByIdProvider(receipt.supplierId!));
                      return supplierAsync.when(
                        data: (supplier) {
                          return VBrandTitleTextWithVerificationIcon(
                            title: supplier?.name ?? "Unknown Supplier",
                          );
                        },
                        loading: () => const Text("Loading..."),
                        error: (error, stackTrace) =>
                            const Text("Error loading supplier"),
                      );
                    },
                  );
                }).toList(),
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (e, st) => const Text('Error loading receipts'),
          ),
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        VMetaDataSection(
          showTag: true,
          tag: 'Receipts',
          tagBackgroundColor: VColors.info,
          tagTextColor: VColors.white,
          icon: Iconsax.receipt,
          child: receiptsAsync.when(
            data: (receipts) {
              if (receipts.isEmpty) {
                return const Text('No receipts found.');
              }
              return Wrap(
                spacing: 8,
                runSpacing: 4,
                children: receipts.map((receipt) {
                  return GestureDetector(
                    onTap: () => context.pushNamed(
                      VRouter.buyReceiptsDetails,
                      pathParameters: {'id': '${receipt.id}'},
                    ),
                    child: Text('#${receipt.id}',
                        style: Theme.of(context).textTheme.labelSmall),
                  );
                }).toList(),
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (e, st) => const Text('Error loading receipts'),
          ),
        ),
      ],
    );
  }
}
