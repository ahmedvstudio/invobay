import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:intl/intl.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import 'package:invobay/features/receipts/widgets/receipt_card_list.dart';

import '../../../common/widgets/dialogs/delete_confirm_dialog.dart';
import '../../../core/providers/common_providers/receipt_edit_provider.dart';
import '../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../core/providers/item_providers/item_related_providers.dart';
import '../../../core/providers/sell_providers/sell_related_providers.dart';
import '../../../core/services/qr_code/receipt_qr_scan.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../common/widgets/appbar/main_appbar.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../core/utils/device/device_utility.dart';
import '../../../core/utils/formatters/formatters.dart';

class SellReceiptsScreen extends ConsumerWidget {
  const SellReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellReceiptData = ref.watch(sellReceiptsProvider);
    final currencySign = ref.watch(currencySignProvider);

    final editState = ref.watch(receiptEditProvider);
    final editController = ref.read(receiptEditProvider.notifier);
    return Scaffold(
      body: Column(
        children: [
          VPrimaryHeaderContainer(
            child: Column(
              children: [
                const VMainAppBar(
                  title: 'Sell Receipts',
                  appbarIcon: Iconsax.tag5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    sellReceiptData.when(
                      data: (receipts) => Row(
                        children: [
                          TextButton.icon(
                            onPressed: () =>
                                VReceiptQRScan.scanQRCode(context, receipts),
                            label: Text(
                              'Scan QR Code',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(
                                    color: VColors.white.withValues(alpha: 0.8),
                                  ),
                            ),
                            icon: Icon(
                              Iconsax.scan_barcode,
                              color: VColors.white.withValues(alpha: 0.8),
                            ),
                          ),
                        ],
                      ),
                      loading: () => TextButton.icon(
                        onPressed: null,
                        label: Text(
                          'Scan QR Code',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        icon: const Icon(Iconsax.scan_barcode),
                      ),
                      error: (_, __) => TextButton.icon(
                        onPressed: null,
                        label: Text(
                          'Scan QR Code',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        icon: const Icon(Iconsax.scan_barcode),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: editController.toggleEditMode,
                      label: Text(
                        editState.isEditMode ? 'Done' : 'Edit',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: VColors.white.withValues(alpha: 0.8),
                            ),
                      ),
                      icon: Icon(
                        editState.isEditMode
                            ? Iconsax.tick_square
                            : Iconsax.edit,
                        color: VColors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: VSizes.spaceBtwSections / 2),
              ],
            ),
          ),
          Expanded(
            child: sellReceiptData.when(
              data: (receipts) {
                final items = receipts.map((receipt) {
                  return {
                    'id': receipt.id.toString(),
                    'paymentStatus': receipt.paymentStatus,
                    'date': DateFormat.yMMMd().format(receipt.date),
                    'receiptId': VHelperFunctions.receiptNo(receipt.id),
                    'total':
                        '$currencySign ${VFormatters.formatPrice(receipt.totalPrice)}',
                  };
                }).toList();

                return VReceiptCardList(
                  items: items,
                  onTap: (id) {
                    if (editState.isEditMode) {
                      editController.toggleSelection(id);
                    } else {
                      context.pushNamed(
                        VRouter.sellReceiptsDetails,
                        pathParameters: {'id': id},
                      );
                    }
                  },
                  isEditMode: editState.isEditMode,
                  selectedItems: editState.selectedItems,
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text("Error: $error")),
            ),
          ),
        ],
      ),
      floatingActionButton: editState.isEditMode &&
              editState.selectedItems.isNotEmpty
          ? Padding(
              padding: EdgeInsets.only(
                  left: VDeviceUtils.getScreenWidth(context) * 0.1),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${editState.selectedItems.length} selected',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: VColors.white.withValues(alpha: 0.7),
                          ),
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: VColors.error,
                    onPressed: () async {
                      final selectedIds =
                          ref.read(receiptEditProvider).selectedItems;

                      if (selectedIds.isEmpty) return;

                      final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (_) => VDeleteConfirmDialog(
                          isGeneral: true,
                          contentText:
                              'Are you sure you want to delete ${selectedIds.length} receipt(s)?',
                        ),
                      );

                      if (confirmed ?? false) {
                        final ids = selectedIds.map(int.parse).toList();
                        final dao = ref.read(sellReceiptDaoProvider);
                        await dao.deleteReceiptsByIds(ids);
                        ref.read(receiptEditProvider.notifier).toggleEditMode();
                        ref.read(itemNotifierProvider.notifier).fetchItems();
                      }
                    },
                    child: const Icon(Icons.delete),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
