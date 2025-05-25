import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/return_related_model/return_model.dart';
import '../../../../core/providers/common_providers/default_providers.dart';
import '../../../../core/providers/common_providers/reset_default_providers.dart';
import '../../../../core/providers/payment_providers/payment_provider.dart';
import '../../../../core/providers/return_providers/return_checkout_notifier.dart';
import '../../../../core/router/router_constant.dart';
import 'checkout_sheet.dart';

void showReturnCheckoutBottomSheet({
  required BuildContext context,
  required WidgetRef ref,
  required double paidAmount,
  required double debtAmount,
  required ReturnCheckoutNotifier checkoutController,
  required List<ReturnItem> returnedItems,
  required double subtotal,
  required double totalPrice,
  required double discountAmount,
  required double shippingFee,
  required double taxFee,
  required PaymentMethod selectedPayment,
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
        resetProviders(ref);
        if (!context.mounted) return;
        context.goNamed(VRouter.returnsReceiptsSuccess);
      },
    ),
  );
}
