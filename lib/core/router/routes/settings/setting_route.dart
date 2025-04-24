import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/router/routes/settings/supplier_route.dart';

import '../../../../features/personalization/profile/profile_screen.dart';
import '../../../../features/personalization/setting/setting_screen.dart';
import '../../../../features/personalization/setting/shop_detail/shop_detail_screen.dart';
import 'appearance_route.dart';
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
      // Appearance Route
      ...appearanceRoute,

      // --> Shop Details
      GoRoute(
          name: VRouter.shopDetails,
          path: '/shopDetails',
          pageBuilder: (context, state) =>
              const MaterialPage(child: ShopDetailScreen())),
    ],
  ),
];
