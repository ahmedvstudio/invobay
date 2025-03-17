import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';

import '../../../features/sales/sales_screen.dart';

List<GoRoute> salesRoutes = [
  GoRoute(
    name: VRouter.sales,
    path: '/sales',
    builder: (context, state) => const SalesScreen(),
  ),
];
