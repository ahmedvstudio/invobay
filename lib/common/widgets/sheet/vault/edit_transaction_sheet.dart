import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/common/widgets/sheet/vault/transaction_form.dart';

import '../../../../core/models/vault_model/vault_transaction_model.dart';
import '../../../../core/providers/common_providers/default_providers.dart';
import '../../../../core/providers/vault_providers/vault_related_providers.dart';
import '../../dialogs/delete_confirm_dialog.dart';

Future<void> showEditVaultTransactionSheet(
  BuildContext context,
  WidgetRef ref,
  VaultTransactionModel transaction,
) async {
  final amountController =
      TextEditingController(text: transaction.amount.toString());
  final descriptionController =
      TextEditingController(text: transaction.description);
  final noteController = TextEditingController(text: transaction.note ?? "");
  final formKey = GlobalKey<FormState>();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (_) => Consumer(
      builder: (context, ref, _) {
        final selectedDate =
            ref.watch(selectedDateProvider) ?? transaction.date;

        return SingleChildScrollView(
          padding: VSpacingStyle.responseKeyboard(context),
          child: VTransactionForm(
            formKey: formKey,
            title: transaction.isOut ? 'Edit Expense' : 'Edit Addition',
            selectedDate: selectedDate,
            amountController: amountController,
            descriptionController: descriptionController,
            noteController: noteController,
            onDatePicked: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                ref.read(selectedDateProvider.notifier).state = pickedDate;
              }
            },
            onDelete: () async {
              final shouldDelete = await showDialog<bool>(
                context: context,
                builder: (context) => const VDeleteConfirmDialog(
                  isCustomer: false,
                  isGeneral: true,
                  contentText: 'This will permanently delete this transaction.',
                ),
              );

              if (shouldDelete == true) {
                final notifier = ref.read(
                    vaultDetailNotifierProvider(transaction.vaultId).notifier);
                if (transaction.isOut) {
                  await notifier.deleteReducedTransaction(transaction.id);
                } else {
                  await notifier.deleteAddedTransaction(transaction.id);
                }
                if (!context.mounted) return;
                context.pop();
              }
            },
            onConfirm: () async {
              if (formKey.currentState!.validate()) {
                final newAmount = double.tryParse(amountController.text) ?? 0.0;
                final description = descriptionController.text;
                final note = noteController.text;

                final notifier = ref.read(
                    vaultDetailNotifierProvider(transaction.vaultId).notifier);
                if (transaction.isOut) {
                  await notifier.updateReducedTransaction(
                    id: transaction.id,
                    amount: newAmount,
                    description: description,
                    note: note,
                    date: selectedDate,
                  );
                } else {
                  await notifier.updateAddedTransaction(
                    id: transaction.id,
                    amount: newAmount,
                    description: description,
                    note: note,
                    date: selectedDate,
                  );
                }
                if (!context.mounted) return;
                context.pop();
              }
            },
          ),
        );
      },
    ),
  );
}
