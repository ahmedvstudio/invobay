import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/personalization/address/customers/add_new_custumer.dart';
import '../../../../features/personalization/address/customers/customers_screen.dart';
import '../../../../features/personalization/address/customers/edit_customer_form.dart';
import '../../router_constant.dart';

List<GoRoute> customerRoute = [
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
      GoRoute(
        name: VRouter.editCustomer,
        path: '/editCustomer/:id',
        pageBuilder: (context, state) {
          final customerId = int.parse(state.pathParameters['id']!);
          return MaterialPage(child: EditCustomerForm(customerId: customerId));
        },
      ),
    ],
  ),
];
