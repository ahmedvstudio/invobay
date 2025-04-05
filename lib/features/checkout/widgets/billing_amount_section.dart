import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import '../../../common/widgets/dialogs/edit_fees_dialog.dart';
import '../../../core/providers/default_providers.dart';
import '../../../core/providers/sell_related_providers/total_checkout_provider.dart';
import '../../../core/providers/sell_related_providers/update_subtotal_provider.dart';
import '../../../core/utils/constants/sizes.dart';

class VBillingAmountSection extends ConsumerWidget {
  const VBillingAmountSection({
    super.key,
    required this.subtotalPrice,
  });

  final double subtotalPrice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shippingFee = ref.watch(shippingFeeProvider);
    final taxFee = ref.watch(taxFeeProvider);
    final currencySign = ref.watch(currencySignProvider);
    final discountApplied = ref.watch(discountAppliedProvider);
    final discountController = ref.watch(discountControllerProvider);

    return GestureDetector(
      onTap: () => showEditFeeDialog(context, ref, shippingFee, taxFee),
      child: Column(
        children: [
          // Subtotal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final subtotal = ref.watch(discountedSubtotal);
                  return Text('$currencySign${subtotal.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyMedium);
                },
              ),
            ],
          ),
          if (discountApplied)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Discount',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: VColors.success)),
                Text('%${discountController.text}',
                    style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
          const SizedBox(height: VSizes.spaceBtwItems / 2),

          // Shipping Fee
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping Fee',
                  style: Theme.of(context).textTheme.bodyMedium),
              Text('$currencySign${shippingFee.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwItems / 2),

          // Tax Fee
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
              Text('$currencySign${taxFee.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwItems / 2),

          // Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order Total',
                  style: Theme.of(context).textTheme.bodyMedium),
              Consumer(
                builder: (context, ref, child) {
                  final total = ref.watch(totalAmountProvider);
                  return Text('$currencySign${total.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleMedium);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
