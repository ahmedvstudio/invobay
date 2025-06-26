import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/widgets/sheet/vault/transaction_form.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../core/providers/common_providers/default_providers.dart';
import '../../../../core/providers/vault_providers/vault_related_providers.dart';
import '../../../styles/spacing_style.dart';

Future<void> showVaultTransactionSheet(
  BuildContext context,
  WidgetRef ref,
  int vaultId,
  bool isOut,
) async {
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  final noteController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (_) => Consumer(
      builder: (context, ref, _) {
        final selectedDate = ref.watch(selectedDateProvider) ?? DateTime.now();
        return SingleChildScrollView(
          padding: VSpacingStyle.responseKeyboard(context),
          child: VTransactionForm(
            formKey: formKey,
            title: isOut ? context.loc.addExpense : context.loc.addToVault,
            amountController: amountController,
            selectedDate: selectedDate,
            descriptionController: descriptionController,
            noteController: noteController,
            isUpdate: false,
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
            onConfirm: () async {
              if (formKey.currentState!.validate()) {
                if (isOut) {
                  await ref
                      .read(vaultDetailNotifierProvider(vaultId).notifier)
                      .reduceFromVault(
                        vaultId: vaultId,
                        amount: double.tryParse(amountController.text) ?? 0.0,
                        description: descriptionController.text,
                        note: noteController.text,
                        date: selectedDate,
                      );
                } else {
                  await ref
                      .read(vaultDetailNotifierProvider(vaultId).notifier)
                      .addToVault(
                        vaultId: vaultId,
                        amount: double.tryParse(amountController.text) ?? 0.0,
                        description: descriptionController.text,
                        note: noteController.text,
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
