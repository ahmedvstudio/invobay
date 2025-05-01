import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/common_providers/default_providers.dart';
import '../../../core/providers/item_providers/item_related_providers.dart';
import '../../../core/utils/messages/snackbar.dart';

class VAddQuantityDialog extends ConsumerWidget {
  final int? itemId;

  const VAddQuantityDialog({super.key, this.itemId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantityState = ref.watch(addQuantityProvider.notifier);
    final quantityInput = ref.watch(addQuantityProvider).trim();
    final validNumberRegex = RegExp(r'^\d+(\.\d{0,2})?$');
    final isValidQuantity = validNumberRegex.hasMatch(quantityInput) &&
        double.tryParse(quantityInput) != null &&
        double.parse(quantityInput) > 0;

    return AlertDialog(
      title: const Text('Add Quantity'),
      content: TextField(
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: const InputDecoration(hintText: 'Enter quantity'),
        onChanged: (value) => quantityState.state = value,
      ),
      actions: [
        TextButton(
          onPressed: () {
            quantityState.state = ''; // Reset the provider state
            context.pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: isValidQuantity
              ? () async {
                  final newQuantity = double.parse(quantityInput);
                  final error = await ref
                      .read(itemNotifierProvider.notifier)
                      .addQuantity(itemId, newQuantity);
                  if (!context.mounted) return;
                  if (error != null) {
                    // Show error message and keep the dialog open
                    VSnackbar.error(context: context, message: error);
                  } else {
                    // Close the dialog only if there's no error
                    quantityState.state = ''; // Reset the provider state
                    context.pop();
                  }
                }
              : null,
          child: const Text('Add'),
        ),
      ],
    );
  }
}
