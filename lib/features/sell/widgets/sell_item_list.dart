import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/sell_provider.dart';
import '../../../core/utils/constants/sizes.dart';
import 'dismissible_items.dart';

class SellItemList extends ConsumerWidget {
  const SellItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellItems = ref.watch(sellProvider);
    final sellNotifier = ref.read(sellProvider.notifier);
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: VSizes.defaultSpace),
        itemCount: sellItems.length,
        itemBuilder: (_, index) {
          final sellItem = sellItems[index];

          return DismissibleItems(
              sellItem: sellItem, sellNotifier: sellNotifier);
        },
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
