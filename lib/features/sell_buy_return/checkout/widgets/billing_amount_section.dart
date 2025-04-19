import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import '../../../../../common/widgets/dialogs/edit_fees_dialog.dart';
import '../../../../../core/providers/common_providers/default_providers.dart';
import '../../../../../core/providers/sell_providers/total_checkout_provider.dart';
import '../../../../../core/providers/sell_providers/update_subtotal_provider.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/validators/validation.dart';

class VBillingAmountSection extends ConsumerWidget {
  const VBillingAmountSection({
    super.key,
    required this.subtotalPrice,
    required this.formKey,
  });

  final double subtotalPrice;
  final Key formKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shippingFee = ref.watch(shippingFeeProvider);
    final taxFee = ref.watch(taxFeeProvider);
    final currencySign = ref.watch(currencySignProvider);
    final discountApplied = ref.watch(discountAppliedProvider);
    final discountController = ref.watch(discountControllerProvider);
    final paidAmountController = ref.watch(paidAmountControllerProvider);

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
                  return Text(
                      '$currencySign${VFormatters.formatPrice(subtotal)}',
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
              Text('$currencySign${VFormatters.formatPrice(shippingFee)}',
                  style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwItems / 2),

          // Tax Fee
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
              Text('$currencySign${VFormatters.formatPrice(taxFee)}',
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
                  return Text('$currencySign${VFormatters.formatPrice(total)}',
                      style: Theme.of(context).textTheme.titleMedium);
                },
              ),
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwItems),
          Form(
            key: formKey,
            child: TextFormField(
              controller: paidAmountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
              ],
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Iconsax.money_recive,
                  color: VColors.primary,
                ),
                suffixText: currencySign,
                labelText: 'Paid Amount',
              ),
              validator: VValidator.validateDoubleNumber,
            ),
          ),
        ],
      ),
    );
  }
}
