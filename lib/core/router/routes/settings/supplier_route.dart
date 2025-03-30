import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/personalization/address/suppliers/add_new_supplier.dart';
import '../../../../features/personalization/address/suppliers/suppliers_screen.dart';
import '../../router_constant.dart';

List<GoRoute> supplierRoute = [
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
];
