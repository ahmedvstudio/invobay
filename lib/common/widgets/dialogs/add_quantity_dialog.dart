import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/item_notifier_provider.dart';

class VAddQuantityDialog extends ConsumerWidget {
  final int itemId;

  const VAddQuantityDialog({super.key, required this.itemId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController quantityController = TextEditingController();

    return AlertDialog(
      title: const Text('Add Quantity'),
      content: TextField(
        controller: quantityController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: 'Enter quantity',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final quantity = int.tryParse(quantityController.text) ?? 0;
            if (quantity > 0) {
              ref
                  .read(itemNotifierProvider.notifier)
                  .addQuantity(itemId, quantity);
            }
            Navigator.pop(context); // Close dialog
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
