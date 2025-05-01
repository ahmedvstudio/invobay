import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:invobay/features/sell_buy_return/receipts/buy_receipts/widgets/buy_floating_select_all_and_delete.dart';

import '../../../../common/widgets/appbar/main_appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../core/providers/buy_providers/buy_related_providers.dart';
import '../../../../core/providers/common_providers/receipt_edit_provider.dart';
import '../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../core/router/router_constant.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/formatters/formatters.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../widgets/receipt_card_list.dart';

class BuyReceiptsScreen extends ConsumerWidget {
  const BuyReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buyReceiptData = ref.watch(buyReceiptsProvider);
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
                  title: 'Buy Receipts',
                  appbarIcon: Iconsax.receipt_15,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: editController.toggleEditMode,
                    label: Text(
                      editState.isEditMode ? 'Done' : 'Edit',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: VColors.white.withValues(alpha: 0.8),
                          ),
                    ),
                    icon: Icon(
                      editState.isEditMode ? Iconsax.tick_square : Iconsax.edit,
                      color: VColors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ),
                const SizedBox(height: VSizes.spaceBtwSections / 2),
              ],
            ),
          ),
          Expanded(
            child: buyReceiptData.when(
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
                      context.pushNamed(VRouter.buyReceiptsDetails,
                          pathParameters: {'id': id});
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
      floatingActionButton: editState.isEditMode
          ? VBuyFloatingSelectAllAndDelete(
              editController: editController,
              buyReceiptData: buyReceiptData,
              editState: editState,
            )
          : null,
    );
  }
}
