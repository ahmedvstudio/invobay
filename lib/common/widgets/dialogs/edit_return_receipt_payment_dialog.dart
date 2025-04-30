import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

import '../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../core/providers/return_providers/return_receipt_detail_provider.dart';
import '../../../core/providers/return_providers/return_related_providers.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../features/inventory/item_details/widgets/meta_data_section.dart';

void showReturnEditReceiptPayment({
  required BuildContext context,
  required WidgetRef ref,
  required int receiptId,
  required double total,
  required double paidAmount,
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
            onPressed: () async {
              final newPaidAmount =
                  double.tryParse(paidAmountController.text) ?? 0.0;
              if (total >= newPaidAmount) {
                await ref
                    .read(returnReceiptNotifierProvider.notifier)
                    .updatePaymentDetails(
                      receiptId: receiptId,
                      newPaidAmount: newPaidAmount,
                      newDebtAmount: total - newPaidAmount,
                      newPaymentStatus: (total - newPaidAmount == 0.0)
                          ? 'Completed'
                          : 'Pending',
                    );
                ref.invalidate(returnReceiptDetailProvider(receiptId));
                if (!context.mounted) return;
                context.pop();
              } else {
                VHelperFunctions.showToasty(
                    message: 'The amount exceeded Total $currencySign $total',
                    backgroundColor: VColors.error);
              }
            },
            child: const Text('Save'),
          )
        ],
      );
    },
  );
}
