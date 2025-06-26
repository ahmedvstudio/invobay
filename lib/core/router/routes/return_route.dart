import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';

import '../../../features/sell_buy_return/checkout/return_checkout/return_checkout_screen.dart';
import '../../../features/sell_buy_return/initial/return/returns_screen.dart';
import '../../models/return_related_model/return_model.dart';

List<GoRoute> returnsRoutes = [
  GoRoute(
    name: VRouter.returns,
    path: '/returns',
    builder: (context, state) => ReturnsScreen(),
    routes: [
      GoRoute(
        name: VRouter.returnCheckout,
        path: '/returnCheckout',
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?; // Get passed data
          final returnedItems =
              extra?['returnedItems'] as List<ReturnItem>? ?? [];

          return MaterialPage(
            child: ReturnCheckoutScreen(
              returnedItems: returnedItems,
            ),
            fullscreenDialog: true,
          );
        },
      ),
    ],
  ),
];
