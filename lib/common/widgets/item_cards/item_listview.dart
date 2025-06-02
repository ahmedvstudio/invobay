import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/constants/sizes.dart';

import '../../../core/database/drift/app_database.dart';
import '../../../core/providers/buy_providers/buy_receipt_details_provider.dart';
import '../../../core/router/router_constant.dart';
import '../../../core/utils/helpers/low_stock_helper.dart';
import 'item_card_horizontal.dart';

class ItemListView extends StatelessWidget {
  final List<Item> items;
  final Function(BuildContext, int) onEdit;
  final Function(BuildContext, int) onDelete;
  final WidgetRef ref;

  const ItemListView({
    super.key,
    required this.items,
    required this.onEdit,
    required this.onDelete,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        padding: VSpacingStyle.withoutTop,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final lowStockColor =
              LowStockHelper(item.quantity, ref).getThreeColor();
          return Stack(
            children: [
              VItemCardHorizontal(
                itemName: item.name,
                itemStock: item.quantity,
                itemPrice: '${item.sellingPrice}',
                onTapItemDetails: () {
                  context.goNamed(VRouter.itemDetail,
                      pathParameters: {'id': item.id.toString()});
                },
                stockIconColor: lowStockColor,
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Consumer(
                  builder: (context, ref, child) {
                    final receiptsAsync =
                        ref.watch(receiptsDetailsProvider(item.id));
                    return receiptsAsync.when(
                      data: (receipts) {
                        final hasHighPriceReceipts = receipts.any(
                          (r) => r.itemPrice > item.buyingPrice,
                        );

                        final isSellingBelowCost =
                            item.sellingPrice <= item.buyingPrice;

                        if (hasHighPriceReceipts || isSellingBelowCost) {
                          return const Icon(
                            Iconsax.info_circle5,
                            color: VColors.error,
                            size: VSizes.iconSm,
                          );
                        }

                        return const SizedBox.shrink();
                      },
                      loading: () => const SizedBox(
                        height: VSizes.iconSm,
                        width: VSizes.iconSm,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      error: (error, stack) => Text('Error: $error'),
                    );
                  },
                ),
              ),
            ],
          );
        },
        separatorBuilder: (_, index) =>
            const SizedBox(height: VSizes.spaceBtwItems / 2),
      ),
    );
  }
}
