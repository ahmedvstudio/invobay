import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/widgets/sheet/sell_buy_return/quantity_input_sheet.dart';
import '../../../../../core/providers/common_providers/default_providers.dart';
import '../../../../../core/providers/sell_providers/sell_related_providers.dart';
import '../../../../../core/utils/constants/enums.dart';
import '../../../../../core/utils/constants/sizes.dart';
import 'dismissible_sell_items.dart';

class SellItemList extends ConsumerWidget {
  const SellItemList({
    required this.isCheckout,
    super.key,
  });

  final bool isCheckout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellItems = ref.watch(sellNotifierProvider);
    final sellNotifier = ref.read(sellNotifierProvider.notifier);
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

                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => QuantityInputBottomSheet(
                      initialQuantity: sellItem.quantity,
                      itemId: sellItem.item.id,
                      type: ReceiptType.sell,
                    ),
                  );
                },
          child: DismissibleSellItems(
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
