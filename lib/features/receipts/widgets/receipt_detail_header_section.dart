import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../core/providers/sell_related_providers/by_id_provider.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';

class VReceiptDetailHeaderSection extends StatelessWidget {
  const VReceiptDetailHeaderSection({
    super.key,
    required this.receiptDate,
    required this.receiptDiscount,
    required this.receiptShippingFee,
    required this.receiptTaxFee,
    required this.receiptPersonId,
    required this.receiptId,
    required this.paymentMethod,
  });
  final DateTime receiptDate;
  final double receiptDiscount;
  final double receiptShippingFee;
  final double receiptTaxFee;
  final int receiptPersonId;
  final int receiptId;
  final String paymentMethod;

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);

    return VRoundedContainer(
      padding: const EdgeInsets.all(VSizes.md),
      showBorder: true,
      backgroundColor: isDark ? VColors.black : VColors.white,
      child: Column(
        children: [
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Receipt No.",
                  style: Theme.of(context).textTheme.bodyMedium),
              Text(receiptId.toString(),
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwItems / 2),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Date:", style: Theme.of(context).textTheme.bodyMedium),
              Text(DateFormat.yMd().format(receiptDate),
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          if (receiptDiscount != 0)
            const SizedBox(height: VSizes.spaceBtwItems / 2),
          if (receiptDiscount != 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Discount:",
                    style: Theme.of(context).textTheme.bodyMedium),
                Text('% $receiptDiscount',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          if (receiptShippingFee != 0)
            const SizedBox(height: VSizes.spaceBtwItems / 2),
          if (receiptShippingFee != 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Shipping Fee:",
                    style: Theme.of(context).textTheme.bodyMedium),
                Text(receiptShippingFee.toString(),
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          if (receiptTaxFee != 0)
            const SizedBox(height: VSizes.spaceBtwItems / 2),
          if (receiptTaxFee != 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tax Fee:", style: Theme.of(context).textTheme.bodyMedium),
                Text(receiptTaxFee.toString(),
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          if (receiptPersonId != 0)
            const SizedBox(height: VSizes.spaceBtwItems / 2),
          if (receiptPersonId != 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Customer:",
                    style: Theme.of(context).textTheme.bodyMedium),
                Consumer(
                  builder: (context, ref, child) {
                    final customerAsync =
                        ref.watch(customerByIdProvider(receiptPersonId));

                    return customerAsync.when(
                      data: (customer) => Text(
                          customer?.name ?? "Unknown Customer",
                          style: Theme.of(context).textTheme.bodyMedium),
                      loading: () => const Text("Loading..."),
                      error: (error, stackTrace) =>
                          const Text("Error loading customer"),
                    );
                  },
                ),
              ],
            ),
          const SizedBox(height: VSizes.spaceBtwItems / 2),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Payment Method",
                  style: Theme.of(context).textTheme.bodyMedium),
              Text(paymentMethod,
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }
}
