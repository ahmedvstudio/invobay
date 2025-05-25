import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/buy_related_model/buy_model.dart';
import '../../../../core/providers/buy_providers/buy_checkout_notifier.dart';
import '../../../../core/providers/common_providers/default_providers.dart'
    show discountTypeProvider;
import '../../../../core/providers/common_providers/reset_default_providers.dart';
import '../../../../core/providers/payment_providers/payment_provider.dart';
import '../../../../core/router/router_constant.dart';
import 'checkout_sheet.dart';

void showBuyCheckoutBottomSheet({
  required BuildContext context,
  required WidgetRef ref,
  required double paidAmount,
  required double debtAmount,
  required BuyCheckoutNotifier checkoutController,
  required List<BuyItem> boughtItems,
  required double subtotal,
  required double totalPrice,
  required double discountAmount,
  required double shippingFee,
  required double taxFee,
  required PaymentMethod selectedPayment,
  required int supplierId,
  required String paymentStatus,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => VCheckoutBottomSheet(
      paidAmount: paidAmount,
      debtAmount: debtAmount,
      subtotal: subtotal,
      totalPrice: totalPrice,
      discountAmount: discountAmount,
      shippingFee: shippingFee,
      taxFee: taxFee,
      selectedPayment: selectedPayment,
      paymentStatus: paymentStatus,
      onConfirm: () async {
        final discountType = ref.read(discountTypeProvider);
        await checkoutController.checkout(
          boughtItems: boughtItems,
          subTotalPrice: subtotal,
          discount: discountAmount,
          shippingFee: shippingFee,
          taxFee: taxFee,
          paymentMethod: selectedPayment.name,
          supplierId: supplierId,
          ref: ref,
          amountPaid: paidAmount,
          amountDebt: debtAmount,
          paymentStatus: paymentStatus,
          totalPrice: totalPrice,
          discountType: discountType.name,
        );
        resetProviders(ref);
        if (!context.mounted) return;
        context.goNamed(VRouter.buyReceiptsSuccess);
      },
    ),
  );
}
