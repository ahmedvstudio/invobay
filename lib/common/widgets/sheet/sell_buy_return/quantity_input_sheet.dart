import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/messages/toast.dart';

import '../../../../core/providers/buy_providers/buy_related_providers.dart';
import '../../../../core/providers/common_providers/default_providers.dart';
import '../../../../core/providers/return_providers/return_related_providers.dart';
import '../../../../core/providers/sell_providers/sell_related_providers.dart';
import '../../../../core/utils/constants/enums.dart';
import '../../../../core/utils/constants/sizes.dart';

class QuantityInputBottomSheet extends ConsumerWidget {
  const QuantityInputBottomSheet({
    super.key,
    required this.initialQuantity,
    this.itemId,
    required this.type,
    this.initialBuyingPrice,
  });

  final double initialQuantity;
  final int? itemId;
  final double? initialBuyingPrice;
  final ReceiptType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantityState = ref.watch(quantityProvider.notifier);
    final buyingPriceState = ref.watch(buyPriceProvider.notifier);

    return Padding(
      padding: VSpacingStyle.responseKeyboard(context),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              type == ReceiptType.sell
                  ? context.loc.enterQuantity
                  : type == ReceiptType.buy
                      ? context.loc.enterValues
                      : context.loc.enterQuantity,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: VSizes.spaceBtwInputFields),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
              ],
              decoration: InputDecoration(hintText: context.loc.quantity),
              onChanged: (value) => quantityState.state = value,
            ),
            if (type == ReceiptType.buy) ...[
              const SizedBox(height: VSizes.spaceBtwInputFields),
              TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                ],
                decoration: InputDecoration(hintText: context.loc.buyingPrice),
                onChanged: (value) => buyingPriceState.state = value,
              ),
            ],
            const SizedBox(height: VSizes.spaceBtwSections),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.pop(),
                    child: Text(context.loc.cancel),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final inputText = ref.read(quantityProvider).trim();
                      final validNumberRegex = RegExp(r'^\d+(\.\d{1,2})?$');

                      if (!validNumberRegex.hasMatch(inputText)) {
                        VToast.error(
                            message: context
                                .loc.invalidQuantityEnterNumberWithMaxDecimals);
                        return;
                      }

                      double? newQuantity = double.tryParse(inputText);
                      if (newQuantity == null || newQuantity <= 0) {
                        VToast.error(message: context.loc.invalidQuantity);
                        return;
                      }

                      if (type == ReceiptType.sell) {
                        ref
                            .read(sellNotifierProvider.notifier)
                            .updateQuantity(itemId!, newQuantity, context);
                      } else if (type == ReceiptType.buy) {
                        final buyPriceText = ref.read(buyPriceProvider).trim();
                        double? newBuyPrice = double.tryParse(buyPriceText);

                        if (newBuyPrice == null || newBuyPrice <= 0) {
                          VToast.error(message: context.loc.invalidPrice);
                          return;
                        }

                        await ref
                            .read(buyNotifierProvider.notifier)
                            .updateQuantityAndPrice(
                                itemId!, newQuantity, context, newBuyPrice);
                      } else if (type == ReceiptType.returns) {
                        await ref
                            .read(returnNotifierProvider.notifier)
                            .updateQuantity(itemId!, newQuantity, context);
                      }
                      if (!context.mounted) return;
                      context.pop();
                    },
                    child: Text(context.loc.confirm),
                  ),
                ),
              ],
            ),
            const SizedBox(height: VSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
