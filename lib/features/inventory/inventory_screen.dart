import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:invobay/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/features/inventory/widgets/inventory_appbar.dart';
import '../../common/widgets/item_cards/item_listview.dart';
import '../../core/providers/item_notifier_provider.dart';
import '../../core/router/router_constant.dart';

class InventoryScreen extends ConsumerWidget {
  const InventoryScreen({super.key});

  void _editItem(BuildContext context, int itemId) {
    context.pushNamed(
      VRouter.editItem,
      pathParameters: {'id': itemId.toString()},
    );
  }

  void _deleteItem(WidgetRef ref, int itemId) {
    ref.read(itemNotifierProvider.notifier).deleteItem(itemId);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemNotifierProvider);

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
            onDelete: (context, itemId) => _deleteItem(ref, itemId),
          ),
        ],
      ),
    );
  }
}
