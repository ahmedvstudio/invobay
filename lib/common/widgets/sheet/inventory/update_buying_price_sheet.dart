import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../core/models/buy_related_model/buy_receipt_with_item_details_model.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/dialogs/dialogs.dart';
import '../../../../features/inventory/item_details/widgets/meta_data_section.dart';

void showUpdateBuyingPriceBottomSheet({
  required BuildContext context,
  required List<BuyReceiptWithItemDetails> highPriceReceipts,
  required double currentBuyingPrice,
  required void Function(double) onUpdate,
}) {
  final TextEditingController controller = TextEditingController(
    text: currentBuyingPrice.toStringAsFixed(2),
  );

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: VSpacingStyle.responseKeyboard(context),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.loc.updateBuyingPrice,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: VSizes.spaceBtwItems),
              Text(
                context.loc.receiptsWithHigherBuyingPrices,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: VSizes.spaceBtwItems / 2),
              ...highPriceReceipts.map((r) => Padding(
                    padding: const EdgeInsets.only(bottom: VSizes.xs),
                    child: VMetaDataSection(
                      tag: '${context.loc.receiptNo} #${r.receiptId}',
                      tagBackgroundColor: VColors.kAccent,
                      tagTextColor: VColors.black,
                      showChild: true,
                      showIcon: false,
                      child: Text(r.itemPrice.toStringAsFixed(2)),
                    ),
                  )),
              const SizedBox(height: VSizes.spaceBtwItems),
              TextField(
                controller: controller,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                ],
                decoration:
                    InputDecoration(labelText: context.loc.newBuyingPrice),
              ),
              const SizedBox(height: VSizes.spaceBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => context.pop(),
                      child: Text(context.loc.cancel),
                    ),
                  ),
                  const SizedBox(width: VSizes.spaceBtwItems),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final entered = double.tryParse(controller.text.trim());
                        if (entered != null && entered > currentBuyingPrice) {
                          context.pop();
                          onUpdate(entered);
                        } else {
                          VDialogs.showAlert(
                            context,
                            context.loc.invalidPrice,
                            context.loc.shouldBeGreaterThanCurrentBuyingPrice,
                          );
                        }
                      },
                      child: Text(context.loc.update),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: VSizes.spaceBtwItems),
            ],
          ),
        ),
      );
    },
  );
}
