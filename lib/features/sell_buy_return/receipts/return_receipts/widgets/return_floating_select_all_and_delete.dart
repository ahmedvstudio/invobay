import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/dialogs/delete_confirm_dialog.dart';
import '../../../../../core/controllers/receipt_edit_controller.dart';
import '../../../../../core/models/return_related_model/return_with_payment_model.dart';
import '../../../../../core/models/state_models/receipt_edit_model.dart';
import '../../../../../core/providers/common_providers/receipt_edit_provider.dart';
import '../../../../../core/providers/item_providers/item_related_providers.dart';
import '../../../../../core/providers/return_providers/return_related_providers.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/device/device_utility.dart';

class VReturnFloatingSelectAllAndDelete extends ConsumerWidget {
  const VReturnFloatingSelectAllAndDelete({
    super.key,
    required this.editController,
    required this.returnReceiptData,
    required this.editState,
  });

  final ReceiptEditController editController;
  final AsyncValue<List<ReturnReceiptsWithPaymentModel>> returnReceiptData;
  final ReceiptEditState editState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding:
          EdgeInsets.only(left: VDeviceUtils.getScreenWidth(context) * 0.1),
      child: Row(
        children: [
          Checkbox(
            value: editController.isAllSelected(
              returnReceiptData.maybeWhen(
                data: (receipts) =>
                    receipts.map((r) => r.id.toString()).toList(),
                orElse: () => <String>[],
              ),
            ),
            onChanged: (bool? checked) {
              final allIds = returnReceiptData.maybeWhen(
                data: (receipts) =>
                    receipts.map((r) => r.id.toString()).toList(),
                orElse: () => <String>[],
              );
              if (checked == true) {
                editController.selectAll(allIds);
              } else {
                editController.deselectAll();
              }
            },
            fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (states.contains(WidgetState.selected)) {
                return VColors.error.withValues(alpha: 0.8);
              }
              return null;
            }),
          ),
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
              final selectedIds = ref.read(receiptEditProvider).selectedItems;

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
                final dao = ref.read(returnReceiptDaoProvider);
                await dao.deleteReceiptsByIds(ids);
                ref.read(receiptEditProvider.notifier).toggleEditMode();
                ref.read(itemNotifierProvider.notifier).fetchItems();
              }
            },
            child: const Icon(Iconsax.trash),
          ),
        ],
      ),
    );
  }
}
