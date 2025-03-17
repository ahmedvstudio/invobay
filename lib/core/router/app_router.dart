import 'package:go_router/go_router.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/router/routes/auth_route.dart';
import 'package:invobay/core/router/routes/inventory_route.dart';
import 'package:invobay/core/router/routes/purchase_route.dart';
import 'package:invobay/core/router/routes/report_route.dart';
import 'package:invobay/core/router/routes/sales_route.dart';
import 'package:invobay/features/error/not_found_screen.dart';

import '../../features/home/home_screen.dart';

final GoRouter invoRouter = GoRouter(
  initialLocation: '/login',
  routes: <RouteBase>[
    ...authRoutes,
    GoRoute(
      name: VRouter.home,
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        ...inventoryRoutes,
        ...purchaseRoutes,
        ...salesRoutes,
        ...reportRoutes,
      ],
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
