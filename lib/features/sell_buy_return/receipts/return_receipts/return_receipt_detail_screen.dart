import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/widgets/text/section_heading.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';

import '../../../../common/styles/spacing_style.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/dialogs/delete_confirm_dialog.dart';
import '../../../../common/widgets/sheet/receipt/edit_receipt_payment_sheet.dart';
import '../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../core/providers/db_providers/hive_providers/shop_detail_provider.dart';
import '../../../../core/providers/item_providers/item_related_providers.dart';
import '../../../../core/providers/return_providers/return_receipt_detail_provider.dart';
import '../../../../core/providers/return_providers/return_related_providers.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/enums.dart';
import '../widgets/receipt_item.dart';
import '../widgets/receipt_bottom_edit.dart';
import '../widgets/receipt_detail_footer_section.dart';
import '../widgets/receipt_detail_header_section.dart';

class ReturnReceiptDetailScreen extends ConsumerWidget {
  final int receiptId;

  const ReturnReceiptDetailScreen({super.key, required this.receiptId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiptAsync = ref.watch(returnReceiptDetailProvider(receiptId));
    final currencySign = ref.watch(currencySignProvider);

    return Scaffold(
      body: receiptAsync.when(
        data: (receiptDetails) {
          final receipt = receiptDetails.receipt;
          final items = receiptDetails.items;
          final payment = receiptDetails.payment;

          return SingleChildScrollView(
            child: Column(
              children: [
                VCustomAppBar(
                  text: context.loc.receiptDetails,
                  showBackArrow: true,
                ),
                Padding(
                  padding: VSpacingStyle.withoutTop,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VReceiptDetailHeaderSection(
                        receiptDate: receipt.date,
                        receiptDiscount: receipt.discount,
                        receiptShippingFee: receipt.shippingFee,
                        receiptTaxFee: receipt.taxFee,
                        receiptPersonId: 0,
                        receiptId: receipt.id,
                        paymentMethod: payment.paymentMethod,
                        isSell: true,
                        subTotalPrice: receipt.subTotalPrice,
                        discountType: receipt.discountType,
                        currencySign: currencySign,
                      ),
                      const SizedBox(height: VSizes.spaceBtwSections),

                      // Items List
                      VSectionHeading(
                        title: '${context.loc.returnedItems}:',
                        showActionButton: false,
                      ),
                      const SizedBox(height: VSizes.spaceBtwSections),

                      ...items.map((item) {
                        return Column(
                          children: [
                            Consumer(
                              builder: (context, ref, child) {
                                final itemAsync =
                                    ref.watch(itemByIdProvider(item.itemId));

                                return itemAsync.when(
                                  data: (itemData) {
                                    if (itemData == null) {
                                      return Center(
                                        child: Text(
                                            context
                                                .loc.itemRemovedFromInventory,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall),
                                      );
                                    }
                                    return VReceiptItem(
                                      itemName: itemData.name,
                                      itemQuantity: item.quantity,
                                      itemPrice: item.price,
                                      currencySign: currencySign,
                                      itemUnit: itemData.itemUnit ??
                                          context.loc.unit_piece,
                                    );
                                  },
                                  loading: () => Center(
                                    child: Text(context.loc.loadingItem,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                  ),
                                  error: (error, stackTrace) => Center(
                                    child: Text(
                                        context.loc.itemRemovedFromInventory,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                  ),
                                );
                              },
                            ),
                            const Divider(),
                          ],
                        );
                      }),

                      const SizedBox(height: VSizes.spaceBtwItems),

                      VReceiptDetailFooterSection(
                        totalPrice:
                            '$currencySign ${VFormatters.formatPrice(receipt.totalPrice)}',
                        paymentStatus: payment.status,
                        paidAmount: VFormatters.formatPrice(payment.paidAmount),
                        debtAmount: VFormatters.formatPrice(payment.debtAmount),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text("${context.loc.error}: $error")),
      ),
      bottomNavigationBar: Consumer(
        builder: (context, ref, child) {
          final shopDetailAsync = ref.watch(shopDetailProvider);
          final receiptAsync =
              ref.watch(returnReceiptDetailProvider(receiptId));

          // Combine two AsyncValues safely
          return shopDetailAsync.when(
            data: (shopDetail) {
              return receiptAsync.when(
                data: (receiptDetails) {
                  final payment = receiptDetails.payment;
                  final receipt = receiptDetails.receipt;

                  // Now you have both shopDetail and receiptDetails available
                  return VReceiptBottomEdit(
                    changePayment: () async {
                      await showEditReceiptPaymentSheet(
                        context: context,
                        ref: ref,
                        receiptId: receiptId,
                        total: receipt.totalPrice,
                        paidAmount: payment.paidAmount,
                        receiptType: ReceiptType.returns,
                      );
                    },
                    withPrint: false,
                    statusIconColor: payment.status == 'Pending'
                        ? VColors.warning
                        : VColors.success,
                    deleteReceipt: () async {
                      final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (context) => VDeleteConfirmDialog(
                          isGeneral: true,
                          contentText:
                              context.loc.areYouSureYouWantToDeleteThisReceipt,
                        ),
                      );

                      if (confirmed == true) {
                        await ref
                            .read(returnReceiptNotifierProvider.notifier)
                            .deleteReceipt(receiptId, ref);
                        if (context.mounted) {
                          context.pop(context);
                        }
                      }
                    },
                  );
                },
                loading: () => const SizedBox(
                  height: 60,
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, stackTrace) => SizedBox(
                    height: 60,
                    child: Center(
                        child: Text(context.loc.errorLoadingReceiptDetails))),
              );
            },
            loading: () => const SizedBox(
              height: 60,
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stackTrace) => SizedBox(
                height: 60,
                child:
                    Center(child: Text(context.loc.errorLoadingShopDetails))),
          );
        },
      ),
    );
  }
}
