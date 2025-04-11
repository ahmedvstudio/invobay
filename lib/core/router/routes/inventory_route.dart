import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/features/inventory/inventory_screen.dart';
import 'package:invobay/features/inventory/screens/add_item_screen.dart';
import 'package:invobay/features/inventory/screens/edit_item_screen.dart';
import 'package:invobay/features/item_details/item_details.dart';
import 'package:invobay/core/router/router_constant.dart';

import '../../providers/item_providers/item_related_providers.dart';

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

                if (items.isEmpty || !items.any((item) => item.id == itemId)) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (context.canPop()) {
                      context.pop();
                    }
                  });
                  return const Scaffold(
                    body: Center(child: Text("Item Deleted Successfully.")),
                  );
                }

                final item = items.firstWhere((item) => item.id == itemId);

                return ItemDetailsScreen(
                  itemId: itemId,
                  title: item.name,
                  stock: item.quantity,
                  buyPrice: item.buyingPrice,
                  sellPrice: item.sellingPrice,
                  supplierName: item.supplierName,
                  barcode: item.barcode,
                  description: item.description,
                  itemUnit: item.itemUnit,
                );
              },
            ),
          );
        },
      ),
    ],
  ),
];
