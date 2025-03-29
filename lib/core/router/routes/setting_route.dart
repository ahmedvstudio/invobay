import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';

import '../../../features/personalization/address/customers/add_new_custumer.dart';
import '../../../features/personalization/address/customers/customers_screen.dart';
import '../../../features/personalization/address/suppliers/add_new_supplier.dart';
import '../../../features/personalization/address/suppliers/suppliers_screen.dart';
import '../../../features/personalization/order/order_screen.dart';
import '../../../features/personalization/profile/profile_screen.dart';
import '../../../features/personalization/setting/setting_screen.dart';

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
      GoRoute(
        name: VRouter.customers,
        path: '/customers',
        pageBuilder: (context, state) =>
            const MaterialPage(child: CustomersScreen()),
        routes: [
          GoRoute(
            name: VRouter.addNewCustomer,
            path: '/addNewCustomer',
            pageBuilder: (context, state) =>
                const MaterialPage(child: AddNewCustomerScreen()),
          ),
        ],
      ),
      GoRoute(
        name: VRouter.suppliers,
        path: '/suppliers',
        pageBuilder: (context, state) =>
            const MaterialPage(child: SuppliersScreen()),
        routes: [
          GoRoute(
            name: VRouter.addNewSupplier,
            path: '/addNewSupplier',
            pageBuilder: (context, state) =>
                const MaterialPage(child: AddNewSupplierScreen()),
          ),
        ],
      ),

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
