import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';

import '../../../features/sell_buy_return/checkout/buy_checkout/buy_checkout_screen.dart';
import '../../../features/sell_buy_return/initial/buy/buy_screen.dart';
import '../../models/buy_related_model/buy_model.dart';

List<GoRoute> buyRoutes = [
  GoRoute(
    name: VRouter.buy,
    path: '/buy',
    builder: (context, state) => BuyScreen(),
    routes: [
      GoRoute(
        name: VRouter.buyCheckout,
        path: '/buyCheckout',
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?; // Get passed data
          final boughtItems = extra?['boughtItems'] as List<BuyItem>? ?? [];

          return MaterialPage(
            child: BuyCheckoutScreen(boughtItems: boughtItems),
            canPop: false,
            fullscreenDialog: true,
          );
        },
      ),
    ],
  ),
];
