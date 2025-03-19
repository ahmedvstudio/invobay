import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/features/receipt/receipt_screen.dart';

List<GoRoute> receiptRoutes = [
  GoRoute(
    name: VRouter.receipts,
    path: '/receipts',
    builder: (context, state) => const ReceiptScreen(),
  ),
];
