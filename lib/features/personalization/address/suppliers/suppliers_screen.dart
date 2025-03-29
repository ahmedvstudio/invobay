import 'package:flutter/cupertino.dart';

import '../../../../core/router/router_constant.dart';
import '../address_list_screen.dart';

class SuppliersScreen extends StatelessWidget {
  const SuppliersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddressListScreen(
      title: 'Suppliers',
      routeName: VRouter.addNewSupplier,
    );
  }
}
