import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/widgets/dialogs/quantity_input_dialog.dart';
import '../../../core/providers/quantity_provider.dart';
import '../../../core/providers/sell_provider.dart';
import '../../../core/utils/constants/sizes.dart';
import 'dismissible_items.dart';

class SellItemList extends ConsumerWidget {
  const SellItemList({
    required this.isCheckout,
    super.key,
  });

  final bool isCheckout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellItems = ref.watch(sellProvider);
    final sellNotifier = ref.read(sellProvider.notifier);
    return ListView.separated(
      physics: isCheckout ? const NeverScrollableScrollPhysics() : null,
      padding: isCheckout
          ? EdgeInsets.zero
          : const EdgeInsets.only(bottom: VSizes.defaultSpace),
      shrinkWrap: true,
      itemCount: sellItems.length,
      itemBuilder: (_, index) {
        final sellItem = sellItems[index];

        return GestureDetector(
          onTap: isCheckout
              ? null
              : () {
                  ref.read(quantityProvider.notifier).state =
                      sellItem.quantity.toString();
                  showDialog(
                    context: context,
                    builder: (context) => VQuantityInputDialog(
                      initialQuantity: sellItem.quantity,
                      itemId: sellItem.item.id,
                    ),
                  );
                },
          child: DismissibleItems(
            sellItem: sellItem,
            sellNotifier: sellNotifier,
            isCheckout: isCheckout,
          ),
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
