import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/default_providers.dart';

class VCustomerNameDialog extends ConsumerWidget {
  const VCustomerNameDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerName = ref.watch(customerNameProvider);
    final TextEditingController controller =
        TextEditingController(text: customerName);

    return AlertDialog(
      title: const Text('Enter Customer Name'),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Customer Name'),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final newName = controller.text.trim().isNotEmpty
                ? controller.text.trim()
                : 'Walk-in Customer';

            ref.read(customerNameProvider.notifier).state = newName;
            context.pop();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
