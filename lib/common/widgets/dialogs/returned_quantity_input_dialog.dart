import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/messages/snackbar.dart';

import '../../../core/providers/common_providers/default_providers.dart';
import '../../../core/providers/return_providers/return_related_providers.dart';

class VReturnedQuantityInputDialog extends ConsumerWidget {
  const VReturnedQuantityInputDialog({
    super.key,
    required this.initialQuantity,
    this.itemId,
  });

  final double initialQuantity;
  final int? itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantityState = ref.watch(quantityProvider.notifier);

    return AlertDialog(
      title: const Text('Enter Quantity'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(
                  r'^\d*\.?\d{0,2}')), // Allow numbers with up to two decimal places
            ],
            decoration: const InputDecoration(hintText: 'Quantity'),
            onChanged: (value) => quantityState.state = value,
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
            final inputText = ref.read(quantityProvider).trim();
            final validNumberRegex = RegExp(r'^\d+(\.\d{1,2})?$');

            if (!validNumberRegex.hasMatch(inputText)) {
              VSnackbar.error(
                  context: context,
                  message:
                      "Invalid quantity. Enter a number with max 2 decimals.");

              return;
            }

            double? newQuantity = double.tryParse(inputText);
            if (newQuantity == null || newQuantity <= 0) {
              VSnackbar.error(context: context, message: "Invalid quantity.");

              return;
            }
            await ref
                .read(returnNotifierProvider.notifier)
                .updateQuantity(itemId!, newQuantity, context);

            if (!context.mounted) return;
            context.pop();
          },
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
