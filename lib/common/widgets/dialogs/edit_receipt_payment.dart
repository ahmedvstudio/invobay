import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:invobay/core/utils/messages/toast.dart';

import '../../../core/providers/buy_providers/buy_receipt_detail_provider.dart';
import '../../../core/providers/buy_providers/buy_related_providers.dart';
import '../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../core/providers/sell_providers/sell_related_providers.dart';
import '../../../core/providers/sell_providers/sell_receipt_detail_provider.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../features/inventory/item_details/widgets/meta_data_section.dart';

void showEditReceiptPayment({
  required BuildContext context,
  required WidgetRef ref,
  required int receiptId,
  required double total,
  required double paidAmount,
  required bool isSell,
}) {
  final paidAmountController =
      TextEditingController(text: paidAmount.toString());
  final currencySign = ref.watch(currencySignProvider);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Edit Payment'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VMetaDataSection(
              tag: 'Total Amount',
              tagBackgroundColor: VColors.info,
              tagTextColor: VColors.white,
              showIcon: false,
              child: Text(
                '$currencySign ${VFormatters.formatPrice(total)}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: VSizes.spaceBtwSections),
            TextField(
              controller: paidAmountController,
              decoration: InputDecoration(
                  labelText: 'Paid Amount', prefix: Text('$currencySign ')),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: isSell
                ? () async {
                    final newPaidAmount =
                        double.tryParse(paidAmountController.text) ?? 0.0;
                    if (total >= newPaidAmount) {
                      await ref
                          .read(sellReceiptNotifierProvider.notifier)
                          .updatePaymentDetails(
                            receiptId: receiptId,
                            newPaidAmount: newPaidAmount,
                            newDebtAmount: total - newPaidAmount,
                            newPaymentStatus: (total - newPaidAmount == 0.0)
                                ? 'Completed'
                                : 'Pending',
                          );
                      ref.invalidate(sellReceiptDetailProvider(receiptId));
                      if (!context.mounted) return;
                      context.pop();
                    } else {
                      VToast.error(
                          message:
                              'The amount exceeded Total $currencySign $total');
                    }
                  }
                : () async {
                    final newPaidAmount =
                        double.tryParse(paidAmountController.text) ?? 0.0;
                    if (total >= newPaidAmount) {
                      await ref
                          .read(buyReceiptNotifierProvider.notifier)
                          .updatePaymentDetails(
                            receiptId: receiptId,
                            newPaidAmount: newPaidAmount,
                            newDebtAmount: total - newPaidAmount,
                            newPaymentStatus: (total - newPaidAmount == 0.0)
                                ? 'Completed'
                                : 'Pending',
                          );
                      ref.invalidate(buyReceiptDetailProvider(receiptId));
                      if (!context.mounted) return;
                      context.pop();
                    } else {
                      VToast.error(
                          message:
                              'The amount exceeded Total $currencySign $total');
                    }
                  },
            child: const Text('Save'),
          )
        ],
      );
    },
  );
}
