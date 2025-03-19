import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';

import '../../../features/sell/sell_screen.dart';

List<GoRoute> salesRoutes = [
  GoRoute(
    name: VRouter.sales,
    path: '/sell',
    builder: (context, state) => const SellScreen(),
  ),
];
