import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/utils/constants/enums.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';

import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../core/providers/customer_providers/customer_related_providers.dart';
import '../../../../core/providers/supplier_providers/supplier_related_providers.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

class VReceiptDetailHeaderSection extends StatelessWidget {
  const VReceiptDetailHeaderSection({
    super.key,
    required this.receiptDate,
    required this.subTotalPrice,
    required this.receiptDiscount,
    required this.receiptShippingFee,
    required this.receiptTaxFee,
    required this.receiptPersonId,
    required this.receiptId,
    required this.paymentMethod,
    required this.currencySign,
    required this.discountType,
    required this.isSell,
  });
  final DateTime receiptDate;
  final double subTotalPrice;
  final double receiptDiscount;
  final double receiptShippingFee;
  final double receiptTaxFee;
  final int receiptPersonId;
  final int receiptId;
  final String paymentMethod;
  final String discountType;
  final String currencySign;
  final bool isSell;
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
              Text("${context.loc.receiptNo}.",
                  style: Theme.of(context).textTheme.bodyMedium),
              Text(receiptId.toString(),
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwItems / 2),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${context.loc.date}:",
                  style: Theme.of(context).textTheme.bodyMedium),
              Text(VFormatters.formatDate(receiptDate),
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwItems / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${context.loc.subtotalPrice}:",
                  style: Theme.of(context).textTheme.bodyMedium),
              Text('$currencySign $subTotalPrice',
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),

          if (receiptDiscount != 0) ...[
            const SizedBox(height: VSizes.spaceBtwItems / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${context.loc.discount}:",
                    style: Theme.of(context).textTheme.bodyMedium),
                Text(
                    discountType == DiscountType.percentage.name
                        ? '% $receiptDiscount'
                        : '$currencySign $receiptDiscount',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ],
          if (receiptShippingFee != 0) ...[
            const SizedBox(height: VSizes.spaceBtwItems / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${context.loc.shippingFee}:",
                    style: Theme.of(context).textTheme.bodyMedium),
                Text('$currencySign ${receiptShippingFee.toString()}',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ],
          if (receiptTaxFee != 0) ...[
            const SizedBox(height: VSizes.spaceBtwItems / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${context.loc.taxFee}:",
                    style: Theme.of(context).textTheme.bodyMedium),
                Text('% $receiptTaxFee',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ],
          if (receiptPersonId != 0) ...[
            const SizedBox(height: VSizes.spaceBtwItems / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    isSell
                        ? "${context.loc.customer}:"
                        : "${context.loc.supplier}:",
                    style: Theme.of(context).textTheme.bodyMedium),
                Consumer(
                  builder: isSell
                      ? (context, ref, child) {
                          final customerAsync =
                              ref.watch(customerByIdProvider(receiptPersonId));

                          return customerAsync.when(
                            data: (customer) => Text(
                                customer?.name ?? context.loc.unknownCustomer,
                                style: Theme.of(context).textTheme.bodyMedium),
                            loading: () => Text("${context.loc.loading}..."),
                            error: (error, stackTrace) =>
                                Text(context.loc.errorLoadingCustomer),
                          );
                        }
                      : (context, ref, child) {
                          final supplierAsync =
                              ref.watch(supplierByIdProvider(receiptPersonId));

                          return supplierAsync.when(
                            data: (supplier) => Text(
                                supplier?.name ?? context.loc.unknownSupplier,
                                style: Theme.of(context).textTheme.bodyMedium),
                            loading: () => Text("${context.loc.loading}..."),
                            error: (error, stackTrace) =>
                                Text(context.loc.errorLoadingSupplier),
                          );
                        },
                ),
              ],
            ),
          ],
          const SizedBox(height: VSizes.spaceBtwItems / 2),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.loc.paymentMethod,
                  style: Theme.of(context).textTheme.bodyMedium),
              Text(
                  VHelperFunctions.getPaymentMethodLabel(
                      context, paymentMethod),
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }
}
