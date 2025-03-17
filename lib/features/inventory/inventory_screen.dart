import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:invobay/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/features/inventory/widgets/inventory_appbar.dart';
import 'package:provider/provider.dart';
import 'package:invobay/core/providers/item_provider.dart';

import '../../common/widgets/item_cards/item_listview.dart';
import '../../core/router/router_constant.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  void _editItem(BuildContext context, int itemId) {
    context.pushNamed(
      VRouter.editItem,
      pathParameters: {'id': itemId.toString()},
    );
  }

  void _deleteItem(BuildContext context, int itemId) {
    final provider = Provider.of<ItemProvider>(context, listen: false);
    provider.deleteItem(itemId);
  }

  @override
  Widget build(BuildContext context) {
    final items = context.watch<ItemProvider>().items;
    return Scaffold(
      body: Column(
        children: [
          VPrimaryHeaderContainer(
            child: Column(
              children: [
                VInventoryAppBar(
                  onPressed: () => context.pushNamed(VRouter.addItem),
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
                const VSearchContainer(text: 'Search items...'),
                const SizedBox(height: VSizes.spaceBtwSections * 1.5),
              ],
            ),
          ),
          ItemListView(
            items: items,
            onEdit: _editItem,
            onDelete: _deleteItem,
          ),
        ],
      ),
    );
  }
}
