import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/router/routes/settings/supplier_route.dart';
import 'package:invobay/features/personalization/setting/shop_settings/shop_detail/shop_detail_screen.dart';

import '../../../../features/personalization/profile/profile_screen.dart';

import '../../../../features/personalization/setting/app_settings/about/about_screen.dart';
import '../../../../features/personalization/setting/app_settings/about/license/license_screen.dart';
import '../../../../features/personalization/setting/app_settings/about/license/widgets/licence_detail_page.dart';
import '../../../../features/personalization/setting/app_settings/about/license/widgets/oss_licenses.dart';
import '../../../../features/personalization/setting/setting_screen.dart';
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

      // --> About
      GoRoute(
        name: VRouter.about,
        path: '/about',
        pageBuilder: (context, state) =>
            const MaterialPage(child: AboutScreen()),
        routes: [
          GoRoute(
            name: VRouter.openSourceLicence,
            path: '/openSourceLicence',
            pageBuilder: (context, state) =>
                const MaterialPage(child: OpenSourceLicensesScreen()),
            routes: [
              GoRoute(
                name: VRouter.licenceDetail,
                path: 'licenceDetail',
                pageBuilder: (context, state) {
                  final package = state.extra as Package;
                  return MaterialPage(
                      child: LicenseDetailPage(package: package));
                },
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
