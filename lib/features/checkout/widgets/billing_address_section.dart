import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../common/widgets/text/section_heading.dart';
import '../../../core/providers/customer_provider.dart';
import '../../../core/utils/constants/sizes.dart';

class VBillingAddressSection extends ConsumerWidget {
  const VBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerName = ref.watch(customerNameProvider);
    final customerNumber = ref.watch(customerPhoneProvider);
    final customerAddress = ref.watch(customerAddressProvider);
    final String dateTime =
        DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text(customerName, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(width: VSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: VSizes.spaceBtwItems),
            Text(customerNumber, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.date_range, color: Colors.grey, size: 16),
            const SizedBox(width: VSizes.spaceBtwItems),
            Text(dateTime, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(width: VSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_city, color: Colors.grey, size: 16),
            const SizedBox(width: VSizes.spaceBtwItems),
            Expanded(
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
