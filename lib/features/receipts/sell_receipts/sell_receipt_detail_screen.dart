import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/widgets/text/section_heading.dart';
import 'package:invobay/core/utils/constants/sizes.dart';

import '../../../common/widgets/appbar/custom_appbar.dart';
import '../../../common/widgets/dialogs/delete_confirm_dialog.dart';
import '../../../core/providers/db_notifiers/app_providers.dart';
import '../../../core/providers/default_providers.dart';
import '../../../core/providers/sell_related_providers/by_id_provider.dart';
import '../../../core/providers/sell_related_providers/sell_receipt_detail_provider.dart';
import '../../../core/utils/constants/colors.dart';
import '../widgets/dismissible_receipt_item.dart';
import '../widgets/receipt_bottom_edit.dart';
import '../widgets/receipt_detail_footer_section.dart';
import '../widgets/receipt_detail_header_section.dart';

class SellReceiptDetailScreen extends ConsumerWidget {
  final int receiptId;

  const SellReceiptDetailScreen({super.key, required this.receiptId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiptAsync = ref.watch(sellReceiptDetailProvider(receiptId));
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
                  text: 'Receipt Detail',
                  showBackArrow: false,
                  actions: [
                    IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(
                          CupertinoIcons.xmark,
                          color: VColors.white,
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: VSizes.defaultSpace,
                      right: VSizes.defaultSpace,
                      bottom: VSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VReceiptDetailHeaderSection(
                        receiptDate: receipt.date,
                        receiptDiscount: receipt.discount,
                        receiptShippingFee: receipt.shippingFee,
                        receiptTaxFee: receipt.taxFee,
                        receiptPersonId: receipt.customerId ?? 0,
                        receiptId: receipt.id,
                      ),
                      const SizedBox(height: VSizes.spaceBtwSections),

                      // Items List
                      const VSectionHeading(
                        title: 'Sold Items:',
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
                                  data: (itemData) => VDismissibleReceiptItem(
                                    dismissKey: Key(item.id.toString()),
                                    itemName: itemData.name,
                                    itemQuantity: item.quantity,
                                    itemPrice: item.price,
                                    currencySign: currencySign,
                                    itemUnit: itemData.itemUnit ?? 'Unit',
                                  ),
                                  loading: () => Center(
                                    child: Text(
                                      "Loading item...",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ),
                                  error: (error, stackTrace) => Center(
                                    child: Text(
                                      "Item removed from inventory",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
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
                            '$currencySign ${receipt.totalPrice.toStringAsFixed(2)}',
                        paymentStatus: payment.status,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text("Error: $error")),
      ),
      bottomNavigationBar: VReceiptBottomEdit(
        addItem: () {},
        deleteReceipt: () async {
          final confirmed = await showDialog<bool>(
            context: context,
            builder: (context) => const VDeleteConfirmDialog(
              isGeneral: true,
              contentText: 'Are you sure you want to delete this receipt?',
            ),
          );

          if (confirmed == true) {
            await ref
                .read(receiptNotifierProvider.notifier)
                .deleteReceipt(receiptId);
            if (context.mounted) {
              context.pop(context);
            }
          }
        },
      ),
    );
  }
}
