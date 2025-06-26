import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import '../../../../../core/providers/common_providers/default_providers.dart';
import '../../../../core/providers/common_providers/total_amount_provider.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/validators/validation.dart';
import '../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../core/providers/theme_providers/theme_related_providers.dart';
import '../../../../core/utils/constants/enums.dart';

class VBillingAmountSection extends ConsumerWidget {
  const VBillingAmountSection({
    super.key,
    required this.formKey,
  });

  final Key formKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shippingFee = ref.watch(shippingFeeProvider);
    final taxFee = ref.watch(taxFeeProvider);
    final currencySign = ref.watch(currencySignProvider);
    final discountApplied = ref.watch(discountAppliedProvider);
    final discountController = ref.watch(discountControllerProvider);
    final paidAmountController = ref.watch(paidAmountControllerProvider);
    final subtotal = ref.watch(subtotalPriceProvider);
    final total = ref.watch(totalAmountProvider);
    final discountType = ref.watch(discountTypeProvider);
    final primaryColor = ref.watch(primaryColorProvider);

    return Column(
      children: [
        // Subtotal
        if (total != subtotal || discountApplied) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.loc.subtotal,
                  style: Theme.of(context).textTheme.bodyMedium),
              Text('$currencySign${VFormatters.formatPrice(subtotal)}',
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          if (discountApplied)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.loc.discount,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: VColors.success)),
                Text(
                    discountType == DiscountType.percentage
                        ? '%${discountController.text}'
                        : '$currencySign${discountController.text}',
                    style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
          const SizedBox(height: VSizes.spaceBtwItems / 2),
        ],
        // Shipping Fee
        if (shippingFee != 0) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.loc.shippingFee,
                  style: Theme.of(context).textTheme.bodyMedium),
              Text('$currencySign${VFormatters.formatPrice(shippingFee)}',
                  style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwItems / 2),
        ],
        // Tax Fee
        if (taxFee != 0) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.loc.taxFee,
                  style: Theme.of(context).textTheme.bodyMedium),
              Text('%${VFormatters.formatPrice(taxFee)}',
                  style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwItems / 2),
        ],
        // Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(context.loc.orderTotal,
                style: Theme.of(context).textTheme.bodyMedium),
            Text('$currencySign${VFormatters.formatPrice(total)}',
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        Form(
          key: formKey,
          child: TextFormField(
            controller: paidAmountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            ],
            decoration: InputDecoration(
              prefixIcon: Icon(
                Iconsax.money_recive,
                color: primaryColor,
              ),
              suffixText: currencySign,
              labelText: context.loc.paidAmount,
            ),
            validator: (value) =>
                VValidator.validateDoubleNumber(context, value),
          ),
        ),
      ],
    );
  }
}
