import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/features/personalization/setting/shop_settings/address/screens/add_new_address.dart';
import 'package:invobay/features/personalization/setting/shop_settings/address/screens/edit_supplier_screen.dart';
import 'package:invobay/features/personalization/setting/shop_settings/address/supplier_address_screen.dart';
import '../../../providers/common_providers/default_providers.dart';
import '../../router_constant.dart';

List<GoRoute> supplierRoute = [
  GoRoute(
    name: VRouter.suppliers,
    path: '/suppliers',
    pageBuilder: (context, state) {
      return MaterialPage(
        child: Consumer(
          builder: (context, ref, child) {
            final isCustomer = ref.watch(isCustomerProvider);
            return SupplierAddressScreen(isCustomer: !isCustomer);
          },
        ),
      );
    },
    routes: [
      GoRoute(
        name: VRouter.addNewSupplier,
        path: '/addNewSupplier',
        pageBuilder: (context, state) {
          return MaterialPage(
              fullscreenDialog: true,
              child: Consumer(
                builder: (context, ref, child) {
                  final isCustomer = ref.watch(isCustomerProvider);
                  return AddNewAddress(isCustomer: !isCustomer);
                },
              ));
        },
      ),
      GoRoute(
        name: VRouter.editSupplier,
        path: '/editSupplier/:id',
        pageBuilder: (context, state) {
          final supplierId = int.parse(state.pathParameters['id']!);
          return MaterialPage(child: EditSupplierForm(supplierId: supplierId));
        },
      ),
    ],
  ),
];
