import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/providers/db_providers/hive_providers/app_settings_provider.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../core/providers/theme_providers/theme_related_providers.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/dialogs/dialogs.dart';
import '../../../../features/inventory/item_details/widgets/meta_data_section.dart';

Future<void> showUpdateSellingPriceBottomSheet({
  required BuildContext context,
  required double currentSellingPrice,
  required double buyingPrice,
  required void Function(double newSellingPrice) onUpdate,
}) async {
  final controller = TextEditingController(
    text: currentSellingPrice.toStringAsFixed(2),
  );

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: VSpacingStyle.responseKeyboard(context),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(context.loc.updateSellingPrice,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: VSizes.spaceBtwItems),
              Text(context.loc.sellingPriceMustBeGreaterThanBuyingPrice),
              const SizedBox(height: VSizes.spaceBtwItems),
              Consumer(
                builder: (context, ref, _) {
                  final currencySign = ref.watch(currencySignProvider);
                  final primaryColor = ref.watch(primaryColorProvider);
                  return VMetaDataSection(
                    tag: context.loc.buyingPrice,
                    tagBackgroundColor: primaryColor,
                    tagTextColor: VColors.white,
                    showChild: true,
                    showIcon: false,
                    child: Text('$buyingPrice $currencySign'),
                  );
                },
              ),
              const SizedBox(height: VSizes.spaceBtwInputFields),
              TextField(
                controller: controller,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                ],
                decoration: InputDecoration(
                  labelText: context.loc.newSellingPrice,
                  hintText: context.loc.enterNewSellingPrice,
                  border: const OutlineInputBorder(),
                ),
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
                        final text = controller.text.trim();
                        final price = double.tryParse(text);
                        if (price != null && price > buyingPrice) {
                          onUpdate(price);
                          context.pop();
                        } else {
                          VDialogs.showAlert(
                            context,
                            context.loc.invalidPrice,
                            context.loc
                                .pleaseEnterValidPriceGreaterThanBuyingPrice,
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
