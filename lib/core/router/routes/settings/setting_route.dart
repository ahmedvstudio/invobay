import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/router/routes/settings/supplier_route.dart';

import '../../../../features/personalization/order/order_screen.dart';
import '../../../../features/personalization/profile/profile_screen.dart';
import '../../../../features/personalization/setting/setting_screen.dart';
import 'customer_route.dart';

List<GoRoute> settingRoutes = [
  GoRoute(
    name: VRouter.settings,
    path: '/settings',
    builder: (context, state) => const SettingsScreen(),
    routes: [
      GoRoute(
        name: VRouter.profile,
        path: '/profile',
        pageBuilder: (context, state) =>
            const MaterialPage(child: ProfileScreen()),
      ),
      // Customer Route
      ...customerRoute,

      // Supplier Route
      ...supplierRoute,

      ///

      GoRoute(
        name: VRouter.orders,
        path: '/orders',
        pageBuilder: (context, state) =>
            const MaterialPage(child: OrdersScreen()),
      ),
    ],
  ),
];
