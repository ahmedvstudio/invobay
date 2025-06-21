import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/personalization/setting/shop_settings/address/customer_address_screen.dart';
import '../../../../features/personalization/setting/shop_settings/address/screens/add_new_address.dart';
import '../../../../features/personalization/setting/shop_settings/address/screens/edit_customer_form.dart';
import '../../../providers/common_providers/default_providers.dart';
import '../../router_constant.dart';

List<GoRoute> customerRoute = [
  GoRoute(
    name: VRouter.customers,
    path: '/customers',
    pageBuilder: (context, state) {
      return MaterialPage(
        child: Consumer(
          builder: (context, ref, child) {
            final isCustomer = ref.watch(isCustomerProvider);
            return CustomerAddressScreen(isCustomer: isCustomer);
          },
        ),
      );
    },
    routes: [
      GoRoute(
        name: VRouter.addNewCustomer,
        path: '/addNewCustomer',
        pageBuilder: (context, state) {
          return MaterialPage(
              fullscreenDialog: true,
              child: Consumer(
                builder: (context, ref, child) {
                  final isCustomer = ref.watch(isCustomerProvider);
                  return AddNewAddress(isCustomer: isCustomer);
                },
              ));
        },
      ),
      GoRoute(
        name: VRouter.editCustomer,
        path: '/editCustomer/:id',
        pageBuilder: (context, state) {
          final customerId = int.parse(state.pathParameters['id']!);
          return MaterialPage(child: Consumer(
            builder: (context, ref, child) {
              ref.watch(isCustomerProvider);
              return EditCustomerForm(customerId: customerId);
            },
          ));
        },
      ),
    ],
  ),
];
