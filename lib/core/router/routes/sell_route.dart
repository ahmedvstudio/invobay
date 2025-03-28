import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/features/checkout/checkout_screen.dart';

import '../../../features/sell/sell_screen.dart';
import '../../models/sell_item_model.dart';
import '../router_constant.dart';

List<GoRoute> salesRoutes = [
  GoRoute(
    name: VRouter.sell,
    path: '/sell',
    pageBuilder: (context, state) => MaterialPage(
      child: SellScreen(),
    ),
    routes: [
      GoRoute(
        name: VRouter.sellCheckout,
        path: '/sellCheckout',
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?; // Get passed data
          final soldItems = extra?['soldItems'] as List<SellItemModel>? ?? [];
          final totalPrice = extra?['totalPrice'] as double? ?? 0.0;

          return MaterialPage(
            child: CheckoutScreen(
              soldItems: soldItems,
              totalPrice: totalPrice,
            ),
          );
        },
      ),
    ],
  ),
];
