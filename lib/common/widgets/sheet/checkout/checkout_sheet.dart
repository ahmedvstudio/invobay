import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/common/widgets/text/section_heading.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

import '../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../core/providers/payment_providers/payment_provider.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../features/inventory/item_details/widgets/meta_data_section.dart';

typedef CheckoutCallback = Future<void> Function();

class VCheckoutBottomSheet extends ConsumerWidget {
  const VCheckoutBottomSheet({
    super.key,
    required this.paidAmount,
    required this.debtAmount,
    required this.subtotal,
    required this.totalPrice,
    required this.discountAmount,
    required this.shippingFee,
    required this.taxFee,
    required this.selectedPayment,
    required this.paymentStatus,
    required this.onConfirm,
  });

  final double paidAmount;
  final double debtAmount;
  final double subtotal;
  final double totalPrice;
  final double discountAmount;
  final double shippingFee;
  final double taxFee;
  final PaymentMethod selectedPayment;
  final String paymentStatus;
  final CheckoutCallback onConfirm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencySign = ref.watch(currencySignProvider);

    return Padding(
      padding: VSpacingStyle.withoutTop,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VSectionHeading(
              title: context.loc.checkoutSummary, showActionButton: false),
          const SizedBox(height: VSizes.spaceBtwItems),
          _CheckoutSummaryContent(
            currencySign: currencySign,
            paidAmount: paidAmount,
            debtAmount: debtAmount,
            totalPrice: totalPrice,
            paymentStatus: paymentStatus,
          ),
          const SizedBox(height: VSizes.spaceBtwSections),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => context.pop(),
                  child: Text(context.loc.cancel),
                ),
              ),
              const SizedBox(width: VSizes.spaceBtwItems),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    await onConfirm();
                    if (!context.mounted) return;
                    context.pop();
                  },
                  child: Text(context.loc.confirm),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CheckoutSummaryContent extends StatelessWidget {
  const _CheckoutSummaryContent({
    required this.currencySign,
    required this.paidAmount,
    required this.debtAmount,
    required this.totalPrice,
    required this.paymentStatus,
  });

  final String currencySign;
  final double paidAmount;
  final double debtAmount;
  final double totalPrice;
  final String paymentStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: VSizes.sm,
      children: [
        VMetaDataSection(
          tag: context.loc.totalAmount,
          tagBackgroundColor: VColors.info,
          tagTextColor: VColors.white,
          showIcon: false,
          child: Text(
            '$currencySign${VFormatters.formatPrice(totalPrice)}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        VMetaDataSection(
          tag: context.loc.paidAmount,
          tagBackgroundColor: VColors.success,
          tagTextColor: VColors.white,
          showIcon: false,
          child: Text(
            '$currencySign${VFormatters.formatPrice(paidAmount)}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        if (debtAmount > 0)
          VMetaDataSection(
            tag: context.loc.debtAmount,
            tagBackgroundColor: VColors.error,
            tagTextColor: VColors.white,
            showIcon: false,
            child: Text(
              '$currencySign${VFormatters.formatPrice(debtAmount)}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: VColors.error),
            ),
          ),
        VMetaDataSection(
          tag: context.loc.status,
          tagBackgroundColor: VColors.darkerGrey,
          tagTextColor: VColors.white,
          showIcon: false,
          child: Text(
            VHelperFunctions.paymentStatusLabel(context, paymentStatus),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: debtAmount > 0 ? VColors.error : VColors.success),
          ),
        ),
      ],
    );
  }
}
