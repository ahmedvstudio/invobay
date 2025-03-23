import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/sell/screen/sell_receipt_screen.dart';
import '../../../features/sell/sell_screen.dart';
import '../../models/sell_model.dart';
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
        name: VRouter.sellReceipt,
        path: '/sellReceipt',
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?; // Get passed data
          final soldItems = extra?['soldItems'] as List<SellItem>? ?? [];
          final totalPrice = extra?['totalPrice'] as double? ?? 0.0;

          return MaterialPage(
            child: SellReceiptScreen(
              soldItems: soldItems,
              totalPrice: totalPrice,
            ),
          );
        },
      ),
    ],
  ),
];
