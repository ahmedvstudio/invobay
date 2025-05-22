import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';

import '../../../core/models/return_related_model/return_model.dart';
import '../../../core/providers/common_providers/default_providers.dart';
import '../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../core/providers/payment_providers/payment_provider.dart';
import '../../../core/providers/common_providers/reset_default_providers.dart';
import '../../../core/providers/return_providers/return_checkout_notifier.dart';
import '../../../core/providers/return_providers/return_related_providers.dart';
import '../../../core/router/router_constant.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../features/inventory/item_details/widgets/meta_data_section.dart';

class VReturnCheckoutConfirmDialog extends ConsumerWidget {
  const VReturnCheckoutConfirmDialog({
    super.key,
    required this.paidAmount,
    required this.debtAmount,
    required this.checkoutController,
    required this.returnedItems,
    required this.subtotal,
    required this.totalPrice,
    required this.discountAmount,
    required this.shippingFee,
    required this.taxFee,
    required this.selectedPayment,
    required this.paymentStatus,
  });

  final double paidAmount;
  final double debtAmount;
  final ReturnCheckoutNotifier checkoutController;
  final List<ReturnItem> returnedItems;
  final double subtotal;
  final double totalPrice;
  final double discountAmount;
  final double shippingFee;
  final double taxFee;
  final PaymentMethod selectedPayment;
  final String paymentStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencySign = ref.watch(currencySignProvider);
    final checkoutController = ref.read(returnCheckoutProvider);
    final discountType = ref.watch(discountTypeProvider);

    return AlertDialog(
      title: const Text('Checkout Summary'),
      content: Column(
        spacing: VSizes.spaceBtwItems,
        mainAxisSize: MainAxisSize.min,
        children: [
          VMetaDataSection(
            tag: 'Total Amount',
            tagBackgroundColor: VColors.info,
            tagTextColor: VColors.white,
            showIcon: false,
            child: Text(
              '$currencySign${VFormatters.formatPrice(totalPrice)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          VMetaDataSection(
            tag: 'Paid Amount',
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
              tag: 'Debt Amount',
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
            tag: 'Status',
            tagBackgroundColor: VColors.darkerGrey,
            tagTextColor: VColors.white,
            showIcon: false,
            child: Text(
              paymentStatus,
              style: Theme.of(context).textTheme.titleMedium!.apply(
                  color: debtAmount > 0 ? VColors.error : VColors.success),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            // Proceed with checkout
            await checkoutController.checkout(
              returnedItems: returnedItems,
              subTotalPrice: subtotal,
              discount: discountAmount,
              shippingFee: shippingFee,
              taxFee: taxFee,
              paymentMethod: selectedPayment.name,
              ref: ref,
              amountPaid: paidAmount,
              amountDebt: debtAmount,
              paymentStatus: paymentStatus,
              totalPrice: totalPrice,
              discountType: discountType.name,
            );

            if (!context.mounted) return;
            resetProviders(ref);
            context.goNamed(VRouter.returnsReceiptsSuccess);
          },
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
