import 'package:flutter/cupertino.dart';

import '../../../../core/router/router_constant.dart';
import '../address_list_screen.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddressListScreen(
      title: 'Customers',
      routeName: VRouter.addNewCustomer,
      isCustomer: true,
    );
  }
}
