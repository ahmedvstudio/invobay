import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';

import '../../../features/purchases/purchases_screen.dart';

List<GoRoute> purchaseRoutes = [
  GoRoute(
    name: VRouter.purchases,
    path: '/purchases',
    builder: (context, state) => const PurchasesScreen(),
  ),
];
