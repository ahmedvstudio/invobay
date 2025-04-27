import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

import '../../../core/providers/buy_providers/buy_related_providers.dart';
import '../../../core/utils/constants/sizes.dart';

Future<void> showAddNewItemDialog(
    BuildContext context, WidgetRef ref, String itemName) async {
  final nameController = TextEditingController(text: itemName);
  final buyingPriceController = TextEditingController();
  final sellingPriceController = TextEditingController();
  final quantityController = TextEditingController(text: '1');

  await VHelperFunctions.showCustomDialog(
    context: context,
    title: 'Add New Item',
    content: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Item Name'),
          ),
          const SizedBox(height: VSizes.spaceBtwInputFields),
          TextField(
            controller: quantityController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            ],
            decoration: const InputDecoration(labelText: 'Quantity'),
          ),
          const SizedBox(height: VSizes.spaceBtwInputFields),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: buyingPriceController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d*\.?\d{0,2}')),
                  ],
                  decoration: InputDecoration(
                      labelText: 'Buying Price',
                      labelStyle: Theme.of(context).textTheme.labelLarge),
                ),
              ),
              const SizedBox(width: VSizes.spaceBtwInputFields),
              Expanded(
                child: TextField(
                  controller: sellingPriceController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d*\.?\d{0,2}')),
                  ],
                  decoration: InputDecoration(
                      labelText: 'Selling Price',
                      labelStyle: Theme.of(context).textTheme.labelLarge),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    buttonText: 'Save',
    onSaved: () {
      final name = nameController.text.trim();
      final buyingPrice = double.tryParse(buyingPriceController.text) ?? 0;
      final sellingPrice = double.tryParse(sellingPriceController.text) ?? 0;
      final quantity = double.tryParse(quantityController.text) ?? 1;

      if (name.isEmpty || buyingPrice <= 0 || sellingPrice <= 0) {
        VHelperFunctions.showAlert(
          context,
          'Alert',
          'Please fill all the fields',
        );
        return;
      }

      ref.read(buyNotifierProvider.notifier).addTemporaryNewItem(
            name: name,
            buyingPrice: buyingPrice,
            sellingPrice: sellingPrice,
            quantity: quantity,
          );

      context.pop();
      context.pop();
    },
  );
}
