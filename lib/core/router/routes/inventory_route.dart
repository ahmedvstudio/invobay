import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/features/inventory/inventory_screen.dart';
import 'package:invobay/features/inventory/widgets/add_item_screen.dart';
import 'package:invobay/features/inventory/widgets/edit_item_screen.dart';
import 'package:invobay/features/item_details/item_details.dart';
import 'package:invobay/core/providers/item_provider.dart';
import 'package:provider/provider.dart';
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
            MaterialPage(child: AddItemScreen(), fullscreenDialog: true),
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
          final itemProvider =
              Provider.of<ItemProvider>(context, listen: false);
          final item =
              itemProvider.items.firstWhere((item) => item.id == itemId);

          return MaterialPage(
            fullscreenDialog: true,
            child: ItemDetailsScreen(
              itemId: itemId,
              title: item.name,
              stock: item.quantity,
              buyPrice: item.buyingPrice,
              sellPrice: item.sellingPrice,
              supplierName: item.supplierName,
              barcode: item.barcode,
              description: item.description,
            ),
          );
        },
      ),
    ],
  ),
];
