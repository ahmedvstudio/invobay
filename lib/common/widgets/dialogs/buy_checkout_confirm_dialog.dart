import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';

import '../../../core/models/buy_related_model/buy_model.dart';
import '../../../core/providers/buy_providers/buy_checkout_notifier.dart';
import '../../../core/providers/buy_providers/buy_related_providers.dart';
import '../../../core/providers/common_providers/default_providers.dart';
import '../../../core/providers/payment_providers/payment_provider.dart';
import '../../../core/providers/common_providers/reset_default_providers.dart';
import '../../../core/router/router_constant.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../features/inventory/item_details/widgets/meta_data_section.dart';

class VBuyCheckoutConfirmDialog extends ConsumerWidget {
  const VBuyCheckoutConfirmDialog({
    super.key,
    required this.totalAmount,
    required this.paidAmount,
    required this.debtAmount,
    required this.checkoutController,
    required this.boughtItems,
    required this.subtotal,
    required this.discountAmount,
    required this.shippingFee,
    required this.taxFee,
    required this.selectedPayment,
    required this.supplierId,
    required this.paymentStatus,
  });

  final double totalAmount;
  final double paidAmount;
  final double debtAmount;
  final BuyCheckoutNotifier checkoutController;
  final List<BuyItem> boughtItems;
  final double subtotal;
  final double discountAmount;
  final double shippingFee;
  final double taxFee;
  final PaymentMethod selectedPayment;
  final int supplierId;
  final String paymentStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencySign = ref.watch(currencySignProvider);
    final checkoutController = ref.read(buyCheckoutProvider);

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
              '$currencySign${VFormatters.formatPrice(totalAmount)}',
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
              boughtItems: boughtItems,
              totalPrice: subtotal,
              discount: discountAmount,
              shippingFee: shippingFee,
              taxFee: taxFee,
              paymentMethod: selectedPayment.name,
              supplierId: supplierId,
              ref: ref,
              amountPaid: paidAmount,
              amountDebt: debtAmount,
              paymentStatus: paymentStatus,
            );

            if (!context.mounted) return;
            resetProviders(ref);
            context.goNamed(VRouter.buyReceiptsSuccess);
          },
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
