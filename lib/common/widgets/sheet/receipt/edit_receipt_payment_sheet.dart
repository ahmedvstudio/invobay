import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import 'package:invobay/core/utils/messages/toast.dart';

import '../../../../core/providers/buy_providers/buy_receipt_detail_provider.dart';
import '../../../../core/providers/buy_providers/buy_related_providers.dart';
import '../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../core/providers/return_providers/return_receipt_detail_provider.dart';
import '../../../../core/providers/return_providers/return_related_providers.dart';
import '../../../../core/providers/sell_providers/sell_receipt_detail_provider.dart';
import '../../../../core/providers/sell_providers/sell_related_providers.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/enums.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../features/inventory/item_details/widgets/meta_data_section.dart';

Future<void> showEditReceiptPaymentSheet({
  required BuildContext context,
  required WidgetRef ref,
  required int receiptId,
  required double total,
  required double paidAmount,
  required ReceiptType receiptType,
}) async {
  final paidAmountController =
      TextEditingController(text: paidAmount.toString());
  final currencySign = ref.watch(currencySignProvider);

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: VSpacingStyle.responseKeyboard(context),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  VHelperFunctions.getReceiptTitle(context, receiptType),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: VSizes.spaceBtwSections),
                VMetaDataSection(
                  tag: context.loc.totalAmount,
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
                    labelText: context.loc.paidAmount,
                    prefix: Text('$currencySign '),
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d*\.?\d{0,2}')),
                  ],
                ),
                const SizedBox(height: VSizes.spaceBtwSections),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => context.pop(),
                        child: Text(context.loc.cancel),
                      ),
                    ),
                    const SizedBox(width: VSizes.defaultSpace),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final newPaidAmount =
                              double.tryParse(paidAmountController.text) ?? 0.0;

                          if (newPaidAmount > total) {
                            VToast.error(
                                message:
                                    '${context.loc.exceedTotalAmount} $currencySign ${VFormatters.formatPrice(total)}');
                            return;
                          }

                          final newDebtAmount = total - newPaidAmount;
                          final newStatus =
                              newDebtAmount == 0.0 ? 'Completed' : 'Pending';

                          switch (receiptType) {
                            case ReceiptType.sell:
                              await ref
                                  .read(sellReceiptNotifierProvider.notifier)
                                  .updatePaymentDetails(
                                    receiptId: receiptId,
                                    newPaidAmount: newPaidAmount,
                                    newDebtAmount: newDebtAmount,
                                    newPaymentStatus: newStatus,
                                  );
                              ref.invalidate(
                                  sellReceiptDetailProvider(receiptId));
                              break;

                            case ReceiptType.buy:
                              await ref
                                  .read(buyReceiptNotifierProvider.notifier)
                                  .updatePaymentDetails(
                                    receiptId: receiptId,
                                    newPaidAmount: newPaidAmount,
                                    newDebtAmount: newDebtAmount,
                                    newPaymentStatus: newStatus,
                                  );
                              ref.invalidate(
                                  buyReceiptDetailProvider(receiptId));
                              break;

                            case ReceiptType.returns:
                              await ref
                                  .read(returnReceiptNotifierProvider.notifier)
                                  .updatePaymentDetails(
                                    receiptId: receiptId,
                                    newPaidAmount: newPaidAmount,
                                    newDebtAmount: newDebtAmount,
                                    newPaymentStatus: newStatus,
                                  );
                              ref.invalidate(
                                  returnReceiptDetailProvider(receiptId));
                              break;
                          }

                          if (!context.mounted) return;
                          context.pop();
                        },
                        child: Text(context.loc.save),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
