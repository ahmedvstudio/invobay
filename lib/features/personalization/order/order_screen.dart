import 'package:flutter/material.dart';
import 'package:invobay/features/personalization/order/widgets/order_list.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../core/utils/constants/sizes.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VAppBar(
        title:
            Text('My Orders', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(VSizes.defaultSpace),
        child: VOrderListItems(),
      ),
    );
  }
}
