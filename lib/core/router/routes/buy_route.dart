import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/features/buy/buy_screen.dart';

List<GoRoute> purchaseRoutes = [
  GoRoute(
    name: VRouter.purchases,
    path: '/buy',
    builder: (context, state) => const BuyScreen(),
  ),
];
