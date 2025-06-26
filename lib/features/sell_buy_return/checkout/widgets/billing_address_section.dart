import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:invobay/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../../common/widgets/text/section_heading.dart';
import '../../../../../core/providers/common_providers/default_providers.dart';
import '../../../../../core/providers/customer_providers/customer_related_providers.dart';
import '../../../../../core/providers/supplier_providers/supplier_related_providers.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/device/device_utility.dart';

class VBillingAddressSection extends ConsumerWidget {
  const VBillingAddressSection({
    super.key,
    required this.isSell,
  });
  final bool isSell;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerName = ref.watch(customerNameProvider);
    final customerNumber = ref.watch(customerPhoneProvider);
    final customerAddress = ref.watch(customerAddressProvider);
    final supplierName = ref.watch(supplierNameProvider);
    final supplierNumber = ref.watch(supplierPhoneProvider);
    final supplierAddress = ref.watch(supplierAddressProvider);
    final String dateTime =
        DateFormat('yyyy/MM/dd - HH:mm').format(DateTime.now());
    final customers = ref.watch(customerNotifierProvider);
    final suppliers = ref.watch(supplierNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSectionHeading(
          title: isSell
              ? context.loc.customerAddress
              : context.loc.supplierAddress,
          buttonTitle: context.loc.change,
          onPressed: isSell
              ? () async {
                  final selectedCustomer = await showModalBottomSheet<String>(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: VSizes.defaultSpace),
                        height: VDeviceUtils.getScreenHeight(context) * 0.5,
                        child: Column(
                          children: [
                            Text(context.loc.selectCustomer,
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(height: VSizes.spaceBtwItems),
                            Expanded(
                              child: ListView.separated(
                                itemCount: customers.length,
                                itemBuilder: (context, index) {
                                  final customer = customers[index];

                                  // Construct the address from customer components
                                  final customerComponents = [
                                    customer.street,
                                    customer.city,
                                    customer.state,
                                    customer.extraPhoneNumber,
                                    customer.country,
                                  ];

                                  final address = customerComponents
                                      .where((component) =>
                                          component != null &&
                                          component.isNotEmpty)
                                      .join(', ');

                                  return VRoundedContainer(
                                    backgroundColor:
                                        VColors.kPrimary.withValues(alpha: 0.2),
                                    child: ListTile(
                                      title: Text(customer.name),
                                      subtitle: Text(address),
                                      onTap: () {
                                        // Update providers with selected customer details
                                        ref
                                            .read(customerNameProvider.notifier)
                                            .state = customer.name;
                                        ref
                                            .read(
                                                customerPhoneProvider.notifier)
                                            .state = customer.phoneNumber ?? '';
                                        ref
                                            .read(customerAddressProvider
                                                .notifier)
                                            .state = address;
                                        ref
                                            .read(customerIDProvider.notifier)
                                            .state = customer.id;
                                        context.pop(customer.name);
                                      },
                                    ),
                                  );
                                },
                                separatorBuilder: (_, index) => const SizedBox(
                                    height: VSizes.spaceBtwItems / 2),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );

                  if (selectedCustomer != null && selectedCustomer.isNotEmpty) {
                    // Perform any additional action here if needed
                  }
                }
              : () async {
                  final selectedSupplier = await showModalBottomSheet<String>(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: VSizes.defaultSpace),
                        height: VDeviceUtils.getScreenHeight(context) * 0.5,
                        child: Column(
                          children: [
                            Text(context.loc.selectSupplier,
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(height: VSizes.spaceBtwItems),
                            Expanded(
                              child: ListView.separated(
                                itemCount: suppliers.length,
                                itemBuilder: (context, index) {
                                  final supplier = suppliers[index];

                                  // Construct the address from supplier components
                                  final supplierComponents = [
                                    supplier.street,
                                    supplier.city,
                                    supplier.state,
                                    supplier.extraPhoneNumber,
                                    supplier.country,
                                  ];

                                  final address = supplierComponents
                                      .where((component) =>
                                          component != null &&
                                          component.isNotEmpty)
                                      .join(', ');

                                  return VRoundedContainer(
                                    backgroundColor:
                                        VColors.kPrimary.withValues(alpha: 0.2),
                                    child: ListTile(
                                      title: Text(supplier.name),
                                      subtitle: Text(address),
                                      onTap: () {
                                        // Update providers with selected supplier details
                                        ref
                                            .read(supplierNameProvider.notifier)
                                            .state = supplier.name;
                                        ref
                                            .read(
                                                supplierPhoneProvider.notifier)
                                            .state = supplier.phoneNumber ?? '';
                                        ref
                                            .read(supplierAddressProvider
                                                .notifier)
                                            .state = address;
                                        ref
                                            .read(supplierIDProvider.notifier)
                                            .state = supplier.id;
                                        context.pop(supplier.name);
                                      },
                                    ),
                                  );
                                },
                                separatorBuilder: (_, index) => const SizedBox(
                                    height: VSizes.spaceBtwItems / 2),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );

                  if (selectedSupplier != null && selectedSupplier.isNotEmpty) {
                    // Perform any additional action here if needed
                  }
                },
        ),
        Text(isSell ? customerName : supplierName,
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: VSizes.spaceBtwItems / 3),
        Row(
          children: [
            const Icon(Icons.date_range, color: Colors.grey, size: 16),
            const SizedBox(width: VSizes.spaceBtwItems),
            Text(dateTime, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: VSizes.spaceBtwItems),
            Text(isSell ? customerNumber : supplierNumber,
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.location_city, color: Colors.grey, size: 16),
            const SizedBox(width: VSizes.spaceBtwItems),
            Flexible(
              child: Text(
                isSell ? customerAddress : supplierAddress,
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
