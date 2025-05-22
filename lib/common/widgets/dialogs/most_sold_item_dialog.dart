import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/report_providers/report_related_providers.dart';

class MostSoldItemsDialog extends ConsumerWidget {
  const MostSoldItemsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(mostSoldItemsProvider);

    return AlertDialog(
      title: const Text('Most Sold Items'),
      content: itemsAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return const Text('No items sold yet.');
          }
          return SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: items.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green.shade100,
                    child: Text('${index + 1}'),
                  ),
                  title: Text(item.name),
                  subtitle: Text('Qty Sold: ${item.totalQuantity}'),
                  trailing: Text(
                    '${item.totalRevenue}',
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
          onPressed: () => context.pop(),
          child: const Text('Close'),
        )
      ],
    );
  }
}
