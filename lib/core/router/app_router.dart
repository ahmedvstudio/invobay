import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/features/auth/password_config/forget_password.dart';
import 'package:invobay/features/auth/password_config/reset_password.dart';
import 'package:invobay/features/auth/signup/signup_screen.dart';
import 'package:invobay/features/home/home.dart';
import 'package:invobay/features/dashboard/dashboard_screen.dart';
import 'package:invobay/features/purchases/purchases_screen.dart';
import 'package:invobay/temp/main_screenii.dart';

import '../../features/auth/login/login_screen.dart';
import '../../features/error/not_found_screen.dart';
import '../../features/inventory/inventory_screen.dart';
import '../../features/reports/reports_screen.dart';
import '../../features/sales/sales_screen.dart';

final GoRouter invoRouter = GoRouter(
  // debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      name: VRouter.home,
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
        name: VRouter.login,
        path: '/login',
        builder: (context, state) => const LoginScreen(),
        routes: <RouteBase>[
          GoRoute(
            name: VRouter.forgetPass,
            path: '/forgetPassword',
            pageBuilder: (context, state) =>
                const MaterialPage(child: ForgetPassword()),
          ),
          GoRoute(
            name: VRouter.resetPass,
            path: '/resetPassword',
            pageBuilder: (context, state) =>
                const MaterialPage(child: ResetPassword()),
          ),
        ]),

    GoRoute(
      name: VRouter.signup,
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      name: VRouter.dashboard,
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      name: VRouter.inventory,
      path: '/inventory',
      builder: (context, state) => const InventoryScreen(),
    ),
    GoRoute(
      name: VRouter.purchases,
      path: '/purchases',
      builder: (context, state) => const PurchasesScreen(),
    ),
    GoRoute(
      name: VRouter.sales,
      path: '/sales',
      builder: (context, state) => const SalesScreen(),
    ),
    GoRoute(
      name: VRouter.reports,
      path: '/reports',
      builder: (context, state) => const ReportsScreen(),
    ),

    // TODO: Remove this route when not needed
    GoRoute(
      name: 'test',
      path: '/test',
      builder: (context, state) => const MainScreen(),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
