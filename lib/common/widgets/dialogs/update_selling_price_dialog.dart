import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../features/inventory/item_details/widgets/meta_data_section.dart';

Future<void> showUpdateSellingPriceDialog({
  required BuildContext context,
  required double currentSellingPrice,
  required double buyingPrice,
  required void Function(double newSellingPrice) onUpdate,
}) async {
  final controller = TextEditingController(
    text: currentSellingPrice.toStringAsFixed(2),
  );

  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(VSizes.defaultSpace)),
      title: const Text('Update Selling Price'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            ],
            decoration: const InputDecoration(
              labelText: 'New Selling Price',
              hintText: 'Enter new selling price',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final text = controller.text.trim();
            final price = double.tryParse(text);
            if (price != null && price >= 0) {
              onUpdate(price);
              context.pop();
            } else {
              VHelperFunctions.showAlert(
                context,
                'Invalid Price',
                'Please enter a valid price greater than or equal to 0.',
              );
            }
          },
          child: const Text('Update'),
        ),
      ],
    ),
  );
}
