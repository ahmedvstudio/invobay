import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/features/receipts/return_receipts/return_receipts_screen.dart';

import '../../../features/receipts/buy_receipts/buy_receipts_screen.dart';
import '../../../features/receipts/receipts_screen.dart';
import '../../../features/receipts/sell_receipts/sell_receipts_screen.dart';

List<GoRoute> receiptsRoutes = [
  GoRoute(
    name: VRouter.receipts,
    path: '/receipts',
    builder: (context, state) => const ReceiptsScreen(),
    routes: [
      GoRoute(
        name: VRouter.sellReceipts,
        path: '/sellReceipts',
        pageBuilder: (context, state) =>
            const MaterialPage(child: SellReceiptsScreen()),
      ),
      GoRoute(
        name: VRouter.buyReceipts,
        path: '/buyReceipts',
        pageBuilder: (context, state) =>
            const MaterialPage(child: BuyReceiptsScreen()),
      ),
      GoRoute(
        name: VRouter.returnReceipts,
        path: '/returnReceipts',
        pageBuilder: (context, state) =>
            const MaterialPage(child: ReturnReceiptsScreen()),
      ),
    ],
  ),
];
