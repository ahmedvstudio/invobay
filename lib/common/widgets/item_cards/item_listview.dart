import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/constants/sizes.dart';

import '../../../core/database/drift/app_database.dart';
import '../../../core/router/router_constant.dart';
import '../../../core/utils/helpers/low_stock_helper.dart';
import 'item_card_horizontal.dart';

class ItemListView extends StatelessWidget {
  final List<Item> items;
  final Function(BuildContext, int) onEdit;
  final Function(BuildContext, int) onDelete;

  const ItemListView({
    super.key,
    required this.items,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.only(
          left: VSizes.defaultSpace,
          right: VSizes.defaultSpace,
          bottom: VSizes.defaultSpace,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final lowStockColor = LowStockHelper(item.quantity).getThreeColor();
          return VItemCardHorizontal(
            itemName: item.name,
            itemStock: '${item.quantity}',
            itemPrice: '${item.sellingPrice}',
            onTapItemDetails: () {
              context.goNamed(VRouter.itemDetail,
                  pathParameters: {'id': item.id.toString()});
            },
            stockIconColor: lowStockColor,
            // nameIconColor: lowStockColor,
          );
        },
        separatorBuilder: (_, index) =>
            const SizedBox(height: VSizes.spaceBtwItems / 2),
      ),
    );
  }
}
