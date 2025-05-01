import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/widgets/dialogs/quantity_input_dialog.dart';
import '../../../../../core/providers/buy_providers/buy_related_providers.dart';
import '../../../../../core/providers/common_providers/default_providers.dart';
import '../../../../../core/utils/constants/sizes.dart';
import 'dismissible_buy_items.dart';

class BuyItemList extends ConsumerWidget {
  const BuyItemList({
    required this.isCheckout,
    super.key,
  });

  final bool isCheckout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buyItems = ref.watch(buyNotifierProvider);
    final buyNotifier = ref.read(buyNotifierProvider.notifier);
    return ListView.separated(
      physics: isCheckout ? const NeverScrollableScrollPhysics() : null,
      padding: isCheckout
          ? EdgeInsets.zero
          : const EdgeInsets.only(bottom: VSizes.defaultSpace),
      shrinkWrap: true,
      itemCount: buyItems.length,
      itemBuilder: (_, index) {
        final buyItem = buyItems[index];

        return GestureDetector(
          onTap: isCheckout
              ? null
              : () {
                  ref.read(quantityProvider.notifier).state =
                      buyItem.quantity.toString();
                  ref.read(buyPriceProvider.notifier).state =
                      buyItem.price.toString();
                  showDialog(
                    context: context,
                    builder: (context) => VQuantityInputDialog(
                      initialQuantity: buyItem.quantity,
                      itemId: buyItem.item.id,
                      initialBuyingPrice: buyItem.price,
                      isSell: false,
                    ),
                  );
                },
          child: DismissibleBuyItems(
            buyItem: buyItem,
            buyNotifier: buyNotifier,
            isCheckout: isCheckout,
          ),
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
