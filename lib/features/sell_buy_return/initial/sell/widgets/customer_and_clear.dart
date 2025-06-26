import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/device/device_utility.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../../common/widgets/sheet/add_sheets/add_new_customer_sheet.dart';
import '../../../../../core/providers/common_providers/default_providers.dart';
import '../../../../../core/providers/customer_providers/customer_related_providers.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';

class VCustomerAndClear extends StatelessWidget {
  const VCustomerAndClear({
    super.key,
    required this.clearAllOnPressed,
  });

  final VoidCallback clearAllOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Consumer(
          builder: (context, ref, _) {
            final customerName = ref.watch(customerNameProvider);
            final customers = ref.watch(customerNotifierProvider);

            return TextButton(
              onPressed: () async {
                final selectedCustomer = await showModalBottomSheet<String>(
                  enableDrag: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: VSizes.defaultSpace),
                      height: VDeviceUtils.getScreenHeight(context) * 0.5,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(context.loc.selectCustomer,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              IconButton(
                                onPressed: () async {
                                  context.pop();
                                  await addNewCustomerBottomSheet(context, ref);
                                },
                                icon: const Icon(Iconsax.add_circle5),
                              )
                            ],
                          ),
                          const SizedBox(height: VSizes.spaceBtwItems),
                          Expanded(
                            child: ListView.separated(
                              itemCount: customers.length,
                              itemBuilder: (context, index) {
                                if (index < customers.length) {
                                  final customer = customers[index];

                                  final customerComponents = [
                                    customer.street,
                                    customer.city,
                                    customer.state,
                                    customer.country,
                                  ];

                                  final address = customerComponents
                                      .where((component) =>
                                          component != null &&
                                          component.isNotEmpty)
                                      .join(', ');

                                  return ListTile(
                                    tileColor:
                                        Colors.teal.withValues(alpha: 0.3),
                                    title: Text(customer.name),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (customer.phoneNumber != null)
                                          Text(customer.phoneNumber ?? ''),
                                        if (address.isNotEmpty) Text(address),
                                      ],
                                    ),
                                    onTap: () {
                                      ref
                                          .read(customerNameProvider.notifier)
                                          .state = customer.name;
                                      ref
                                          .read(customerPhoneProvider.notifier)
                                          .state = customer.phoneNumber ?? '';
                                      ref
                                          .read(
                                              customerAddressProvider.notifier)
                                          .state = address;
                                      ref
                                          .read(customerIDProvider.notifier)
                                          .state = customer.id;
                                      context.pop(customer.name);
                                    },
                                  );
                                }
                                return Container();
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

                // If a new customer was selected, update the name provider
                if (selectedCustomer != null && selectedCustomer.isNotEmpty) {
                  ref.read(customerNameProvider.notifier).state =
                      selectedCustomer;
                }
              },
              child: Text(
                '${context.loc.customer}:\n$customerName',
                style: const TextStyle(color: VColors.white),
              ),
            );
          },
        ),
        TextButton(
          onPressed: clearAllOnPressed,
          child: Text(
            context.loc.clearAll,
            style: const TextStyle(color: VColors.white),
          ),
        ),
      ],
    );
  }
}
