import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce/hive.dart';
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
import '../../features/personalization/setting/shop_settings/vault/vault_screen.dart';
import '../utils/constants/hive_box_strings.dart';

final navigatorKey = GlobalKey<NavigatorState>();

/// --> onBoarding check
final box = Hive.box(VHive.settingsBox);
final onboardingCompleted =
    box.get(VHive.onBoardingCompletedKey, defaultValue: false);

/// --> Router
final GoRouter invoRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: onboardingCompleted ? '/' : '/onBoarding',
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
          name: VRouter.vault,
          path: '/vault',
          builder: (context, state) => const VaultScreen(),
        ),
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
