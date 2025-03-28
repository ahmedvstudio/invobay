import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/features/buy/buy_screen.dart';

List<GoRoute> buyRoutes = [
  GoRoute(
    name: VRouter.buy,
    path: '/buy',
    builder: (context, state) => const BuyScreen(),
  ),
];
