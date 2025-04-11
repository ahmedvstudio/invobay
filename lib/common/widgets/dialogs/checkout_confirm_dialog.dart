import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/sell_model.dart';
import '../../../core/providers/default_providers.dart';
import '../../../core/providers/payment_provider.dart';
import '../../../core/providers/reset_default_providers.dart';
import '../../../core/providers/sell_related_providers/sell_checkout_provider.dart';
import '../../../core/providers/sell_related_providers/sell_receipts_provider.dart';
import '../../../core/router/router_constant.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../features/item_details/widgets/meta_data_section.dart';

class VCheckoutConfirmDialog extends ConsumerWidget {
  const VCheckoutConfirmDialog({
    super.key,
    required this.totalAmount,
    required this.paidAmount,
    required this.debtAmount,
    required this.checkoutController,
    required this.soldItems,
    required this.subtotal,
    required this.discountAmount,
    required this.shippingFee,
    required this.taxFee,
    required this.selectedPayment,
    required this.customerId,
    required this.paymentStatus,
  });

  final double totalAmount;
  final double paidAmount;
  final double debtAmount;
  final SellCheckoutNotifier checkoutController;
  final List<SellItem> soldItems;
  final double subtotal;
  final double discountAmount;
  final double shippingFee;
  final double taxFee;
  final PaymentMethod selectedPayment;
  final int customerId;
  final String paymentStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencySign = ref.watch(currencySignProvider);
    final checkoutController = ref.read(sellCheckoutProvider);

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
              '$currencySign${totalAmount.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          VMetaDataSection(
            tag: 'Paid Amount',
            tagBackgroundColor: VColors.success,
            tagTextColor: VColors.white,
            showIcon: false,
            child: Text(
              '$currencySign${paidAmount.toStringAsFixed(2)}',
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
                '$currencySign${debtAmount.toStringAsFixed(2)}',
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
              soldItems: soldItems,
              totalPrice: subtotal,
              discount: discountAmount,
              shippingFee: shippingFee,
              taxFee: taxFee,
              paymentMethod: selectedPayment.name,
              customerId: customerId,
              ref: ref,
              amountPaid: paidAmount,
              amountDebt: debtAmount,
              paymentStatus: paymentStatus,
            );

            if (!context.mounted) return;
            resetProviders(ref);
            context.goNamed(VRouter.sellReceiptsSuccess);
          },
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
