import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/widgets/sheet/sell_buy_return/quantity_input_sheet.dart';
import '../../../../../core/providers/common_providers/default_providers.dart';
import '../../../../../core/providers/return_providers/return_related_providers.dart';
import '../../../../../core/utils/constants/enums.dart';
import '../../../../../core/utils/constants/sizes.dart';
import 'dismissible_return_items.dart';

class ReturnedItemList extends ConsumerWidget {
  const ReturnedItemList({
    required this.isCheckout,
    super.key,
  });

  final bool isCheckout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final returnItems = ref.watch(returnNotifierProvider);
    final returnNotifier = ref.read(returnNotifierProvider.notifier);
    return ListView.separated(
      physics: isCheckout ? const NeverScrollableScrollPhysics() : null,
      padding: isCheckout
          ? EdgeInsets.zero
          : const EdgeInsets.only(bottom: VSizes.defaultSpace),
      shrinkWrap: true,
      itemCount: returnItems.length,
      itemBuilder: (_, index) {
        final returnItem = returnItems[index];

        return GestureDetector(
          onTap: isCheckout
              ? null
              : () {
                  ref.read(quantityProvider.notifier).state =
                      returnItem.quantity.toString();

                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => QuantityInputBottomSheet(
                      initialQuantity: returnItem.quantity,
                      itemId: returnItem.item.id,
                      type: ReceiptType.returns,
                    ),
                  );
                },
          child: DismissibleReturnItems(
            returnItem: returnItem,
            returnNotifier: returnNotifier,
            isCheckout: isCheckout,
          ),
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
