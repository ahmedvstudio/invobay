import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/report_providers/report_related_providers.dart';

class CustomerDebtsDialog extends ConsumerWidget {
  const CustomerDebtsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debtorsAsync = ref.watch(customerDebtsProvider);

    return AlertDialog(
      title: const Text('Customer Debts'),
      content: debtorsAsync.when(
        data: (debtors) {
          if (debtors.isEmpty) {
            return const Text('No debtors found.');
          }
          return SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: debtors.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final debtor = debtors[index];
                return ListTile(
                  leading: const Icon(Icons.warning_amber_outlined),
                  title: Text(debtor.name),
                  trailing: Text(
                    debtor.totalDebt.toStringAsFixed(2),
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          );
        },
        loading: () => const SizedBox(
            height: 100, child: Center(child: CircularProgressIndicator())),
        error: (e, st) => Text('Error: $e'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        )
      ],
    );
  }
}
