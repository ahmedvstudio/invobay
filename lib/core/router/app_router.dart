import 'package:go_router/go_router.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/router/routes/auth_route.dart';
import 'package:invobay/core/router/routes/inventory_route.dart';
import 'package:invobay/core/router/routes/buy_route.dart';
import 'package:invobay/core/router/routes/notification_route.dart';
import 'package:invobay/core/router/routes/receipts_route.dart';
import 'package:invobay/core/router/routes/report_route.dart';
import 'package:invobay/core/router/routes/return_route.dart';
import 'package:invobay/core/router/routes/sell_route.dart';
import 'package:invobay/core/router/routes/settings/setting_route.dart';
import 'package:invobay/core/router/routes/success_fail_routes.dart';
import 'package:invobay/features/error/not_found_screen.dart';

import '../../features/home/home_screen.dart';
import '../../features/low_stock/low_stock_screen.dart';

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
        ...buyRoutes,
        ...salesRoutes,
        ...reportRoutes,
        ...receiptsRoutes,
        ...settingRoutes,
        ...notificationRoutes,
        ...returnsRoutes,
        ...successFailRoute,
        GoRoute(
          name: VRouter.lowStockScreen,
          path: '/lowStock',
          builder: (context, state) => const LowStockScreen(),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
