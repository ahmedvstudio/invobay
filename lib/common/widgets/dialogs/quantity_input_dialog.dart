import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

import '../../../core/providers/buy_providers/buy_related_providers.dart';
import '../../../core/providers/common_providers/default_providers.dart';
import '../../../core/providers/sell_providers/sell_related_providers.dart';

class VQuantityInputDialog extends ConsumerWidget {
  const VQuantityInputDialog({
    super.key,
    required this.initialQuantity,
    this.itemId,
    required this.isSell,
  });

  final double initialQuantity;
  final int? itemId;
  final bool isSell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantityState = ref.watch(quantityProvider.notifier);

    return AlertDialog(
      title: const Text('Enter Quantity'),
      content: TextField(
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(
              r'^\d*\.?\d{0,2}')), // Allow numbers with up to two decimal places
        ],
        decoration: const InputDecoration(hintText: 'Enter quantity'),
        onChanged: (value) => quantityState.state = value,
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final inputText = ref.read(quantityProvider).trim();
            final validNumberRegex = RegExp(r'^\d+(\.\d{1,2})?$');

            if (!validNumberRegex.hasMatch(inputText)) {
              VHelperFunctions.showSnackBar(
                context: context,
                message:
                    "Invalid quantity. Enter a number with max 2 decimals.",
              );
              return;
            }

            double? newQuantity = double.tryParse(inputText);
            if (newQuantity == null || newQuantity <= 0) {
              VHelperFunctions.showSnackBar(
                context: context,
                message: "Invalid quantity",
              );
              return;
            }
            if (isSell) {
              ref
                  .read(sellNotifierProvider.notifier)
                  .updateQuantity(itemId!, newQuantity, context);
            } else {
              ref
                  .read(buyNotifierProvider.notifier)
                  .updateQuantity(itemId!, newQuantity, context);
            }
            context.pop();
          },
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
