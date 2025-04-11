import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:invobay/common/widgets/custom_shapes/containers/rounded_container.dart';

import '../../../../../common/widgets/text/section_heading.dart';
import '../../../core/providers/db_notifiers/app_providers.dart';
import '../../../core/providers/default_providers.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/device/device_utility.dart';

class VBillingAddressSection extends ConsumerWidget {
  const VBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerName = ref.watch(customerNameProvider);
    final customerNumber = ref.watch(customerPhoneProvider);
    final customerAddress = ref.watch(customerAddressProvider);
    final String dateTime =
        DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
    final customers = ref.watch(customerNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () async {
            final selectedCustomer = await showModalBottomSheet<String>(
              context: context,
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: VSizes.defaultSpace),
                  height: VDeviceUtils.getScreenHeight(context) * 0.5,
                  child: Column(
                    children: [
                      Text('Select a Customer',
                          style: Theme.of(context).textTheme.headlineSmall),
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
                              customer.postalCode,
                              customer.country,
                            ];

                            final address = customerComponents
                                .where((component) =>
                                    component != null && component.isNotEmpty)
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
                                      .read(customerPhoneProvider.notifier)
                                      .state = customer.phoneNumber ?? '';
                                  ref
                                      .read(customerAddressProvider.notifier)
                                      .state = address;
                                  ref.read(customerIDProvider.notifier).state =
                                      customer.id;
                                  context.pop(customer.name);
                                },
                              ),
                            );
                          },
                          separatorBuilder: (_, index) =>
                              const SizedBox(height: VSizes.spaceBtwItems / 2),
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
          },
        ),
        Text(customerName, style: Theme.of(context).textTheme.bodyLarge),
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
            Text(customerNumber, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.location_city, color: Colors.grey, size: 16),
            const SizedBox(width: VSizes.spaceBtwItems),
            Flexible(
              child: Text(
                customerAddress,
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
