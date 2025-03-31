import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:invobay/core/utils/device/device_utility.dart';

import '../../../common/widgets/dialogs/add_new_customer_dialog.dart';
import '../../../core/providers/db_notifiers/app_providers.dart';
import '../../../core/providers/default_providers.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

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
                final selectedCustomer = await showDialog<String>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Select or Add a Customer'),
                      content: SizedBox(
                        width: double.maxFinite,
                        height: VDeviceUtils.getScreenHeight(context) * 0.5,
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: customers.length + 1,
                          itemBuilder: (context, index) {
                            if (index < customers.length) {
                              final customer = customers[index];
                              return VRoundedContainer(
                                backgroundColor:
                                    VColors.kPrimary.withValues(alpha: 0.2),
                                child: ListTile(
                                  title: Text(customer.name),
                                  onTap: () => context.pop(customer.name),
                                ),
                              );
                            } else {
                              return OutlinedButton(
                                  onPressed: () async {
                                    context.pop();
                                    await addNewCustomerDialog(context, ref);
                                  },
                                  child: const Text('Add New Customer'));
                            }
                          },
                          separatorBuilder: (_, index) =>
                              const SizedBox(height: VSizes.spaceBtwItems / 2),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => context.pop(),
                          child: const Text('Cancel'),
                        ),
                      ],
                    );
                  },
                );

                if (selectedCustomer != null && selectedCustomer.isNotEmpty) {
                  ref.read(customerNameProvider.notifier).state =
                      selectedCustomer;
                }
              },
              child: Text(
                'Customer:\n$customerName',
                style: const TextStyle(color: VColors.white),
              ),
            );
          },
        ),
        TextButton(
          onPressed: clearAllOnPressed,
          child: const Text(
            'Clear all',
            style: TextStyle(color: VColors.white),
          ),
        ),
      ],
    );
  }
}
