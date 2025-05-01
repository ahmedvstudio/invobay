import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';

import '../../../features/sell_buy_return/receipts/buy_receipts/buy_receipts_detail_screen.dart';
import '../../../features/sell_buy_return/receipts/buy_receipts/buy_receipts_screen.dart';
import '../../../features/sell_buy_return/receipts/return_receipts/return_receipt_detail_screen.dart';
import '../../../features/sell_buy_return/receipts/return_receipts/return_receipts_screen.dart';
import '../../../features/sell_buy_return/receipts/sell_receipts/sell_receipt_detail_screen.dart';
import '../../../features/sell_buy_return/receipts/sell_receipts/sell_receipts_screen.dart';

List<GoRoute> receiptsRoutes = [
  GoRoute(
    name: VRouter.sellReceipts,
    path: '/sellReceipts',
    pageBuilder: (context, state) =>
        const MaterialPage(child: SellReceiptsScreen()),
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
  GoRoute(
    name: VRouter.buyReceipts,
    path: '/buyReceipts',
    pageBuilder: (context, state) =>
        const MaterialPage(child: BuyReceiptsScreen()),
    routes: [
      GoRoute(
        name: VRouter.buyReceiptsDetails,
        path: '/buyReceiptsDetails/:id',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return BuyReceiptsDetailScreen(receiptId: id);
        },
      ),
    ],
  ),
  GoRoute(
    name: VRouter.returnReceipts,
    path: '/returnReceipts',
    pageBuilder: (context, state) =>
        const MaterialPage(child: ReturnReceiptsScreen()),
    routes: [
      GoRoute(
        name: VRouter.returnsReceiptsDetails,
        path: '/returnsReceiptsDetails/:id',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return ReturnReceiptDetailScreen(receiptId: id);
        },
      ),
    ],
  ),
];
