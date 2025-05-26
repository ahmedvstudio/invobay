import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/utils/constants/sizes.dart';

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
              Text('Update Selling Price',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: VSizes.spaceBtwItems),
              const Text('Selling price must be greater than buying Price.'),
              const SizedBox(height: VSizes.spaceBtwItems),
              VMetaDataSection(
                tag: 'Buy Price',
                tagBackgroundColor: VColors.primary,
                tagTextColor: VColors.white,
                showChild: true,
                showIcon: false,
                child: Text('$buyingPrice'),
              ),
              const SizedBox(height: VSizes.spaceBtwInputFields),
              TextField(
                controller: controller,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                ],
                decoration: const InputDecoration(
                  labelText: 'New Selling Price',
                  hintText: 'Enter new selling price',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: VSizes.spaceBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      final text = controller.text.trim();
                      final price = double.tryParse(text);
                      if (price != null && price > buyingPrice) {
                        onUpdate(price);
                        context.pop();
                      } else {
                        VDialogs.showAlert(
                          context,
                          'Invalid Price',
                          'Please enter a valid price greater than buying price.',
                        );
                      }
                    },
                    child: const Text('Update'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
