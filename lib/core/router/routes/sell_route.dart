import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/receipts/sell_receipts/sell_receipt_detail_screen.dart';
import '../../../features/sell_buy_return/checkout/sell_checkout/sell_checkout_screen.dart';
import '../../../features/sell_buy_return/sell/sell_screen.dart';
import '../../models/sell_related_model/sell_model.dart';
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
          final soldItems = extra?['soldItems'] as List<SellItem>? ?? [];
          final totalPrice = extra?['totalPrice'] as double? ?? 0.0;

          return MaterialPage(
            child: SellCheckoutScreen(
              soldItems: soldItems,
              totalPrice: totalPrice,
            ),
            canPop: false,
            fullscreenDialog: true,
          );
        },
        routes: [
          GoRoute(
            name: VRouter.sellReceiptsDetails,
            path: '/sellReceiptsDetails/:id',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return SellReceiptDetailScreen(receiptId: id);
            },
          ),
        ],
      ),
    ],
  ),
];
