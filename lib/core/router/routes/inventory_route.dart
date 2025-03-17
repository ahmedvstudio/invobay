import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/features/inventory/inventory_screen.dart';
import 'package:invobay/features/inventory/widgets/add_item_screen.dart';
import 'package:invobay/features/inventory/widgets/edit_item_screen.dart';
import 'package:invobay/features/item_details/item_details.dart';
import 'package:invobay/core/providers/item_notifier_provider.dart';
import 'package:invobay/core/router/router_constant.dart';

List<GoRoute> inventoryRoutes = [
  GoRoute(
    name: VRouter.inventory,
    path: '/inventory',
    builder: (context, state) => const InventoryScreen(),
    routes: [
      GoRoute(
        name: VRouter.addItem,
        path: '/addItem',
        pageBuilder: (context, state) =>
            const MaterialPage(child: AddItemScreen(), fullscreenDialog: true),
      ),
      GoRoute(
        name: VRouter.editItem,
        path: '/editItem/:id',
        builder: (context, state) {
          final itemId = int.parse(state.pathParameters['id']!);
          return EditItemScreen(itemId: itemId);
        },
      ),
      GoRoute(
        name: VRouter.itemDetail,
        path: '/itemDetail/:id',
        pageBuilder: (context, state) {
          final itemId = int.parse(state.pathParameters['id']!);
          return MaterialPage(
            fullscreenDialog: true,
            child: Consumer(
              builder: (context, ref, child) {
                final items = ref.watch(itemNotifierProvider);

                if (items.isEmpty) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    context.pop();
                  });
                  return const Center(child: Text("No items available."));
                }

                final item = items.firstWhere(
                  (item) => item.id == itemId,
                  orElse: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      context.pop();
                    });
                    return throw StateError('Item not found');
                  },
                );

                return ItemDetailsScreen(
                  itemId: itemId,
                  title: item.name,
                  stock: item.quantity,
                  buyPrice: item.buyingPrice,
                  sellPrice: item.sellingPrice,
                  supplierName: item.supplierName,
                  barcode: item.barcode,
                  description: item.description,
                );
              },
            ),
          );
        },
      ),
    ],
  ),
];
