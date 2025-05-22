import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/report_providers/report_related_providers.dart';

class TopCustomersDialog extends ConsumerWidget {
  const TopCustomersDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topCustomersAsync = ref.watch(topCustomersProvider);

    return AlertDialog(
      title: const Text('Top Customers'),
      content: topCustomersAsync.when(
        data: (customers) {
          if (customers.isEmpty) {
            return const Text('No data available.');
          }
          return SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: customers.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final customer = customers[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text(customer.name),
                  trailing: Text(
                    customer.totalSpent.toStringAsFixed(2),
                    style: const TextStyle(fontWeight: FontWeight.bold),
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
