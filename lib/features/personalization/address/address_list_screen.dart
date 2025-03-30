import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/features/personalization/address/single_address.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../core/providers/db_notifiers/customer_notifier.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

class AddressListScreen extends ConsumerWidget {
  final String title;
  final String routeName;

  const AddressListScreen({
    super.key,
    required this.title,
    required this.routeName,
    required this.isCustomer,
  });

  final bool isCustomer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customers = ref.watch(customerProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(routeName),
        backgroundColor: VColors.primary,
        child: const Icon(Iconsax.add, color: VColors.white),
      ),
      appBar: VAppBar(
        showBackArrow: true,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: isCustomer
              ? Column(
                  children: customers
                      .map((customer) => VSingleAddress(
                            onTap: () => context.goNamed('editCustomer',
                                pathParameters: {'id': customer.id.toString()}),
                            name: customer.name,
                            phoneNumber: customer.phoneNumber,
                            address:
                                '${customer.postalCode} ${customer.street}, ${customer.city}, ${customer.state}, ${customer.country}',
                          ))
                      .toList(),
                )

              /// TODO: add supplier
              : const Column(
                  children: [Text('Supplier here')],
                ),
        ),
      ),
    );
  }
}
