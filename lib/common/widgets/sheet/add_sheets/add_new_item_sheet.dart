import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/messages/toast.dart';
import 'package:invobay/core/utils/validators/validation.dart';

import '../../../../core/providers/buy_providers/buy_related_providers.dart';

Future<void> showAddNewItemBottomSheet(
    BuildContext context, WidgetRef ref, String itemName) async {
  final nameController = TextEditingController(text: itemName);
  final buyingPriceController = TextEditingController();
  final sellingPriceController = TextEditingController();
  final quantityController = TextEditingController(text: '1');
  final formKey = GlobalKey<FormState>();
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => Padding(
      padding: VSpacingStyle.responseKeyboard(context),
      child: SafeArea(
        child: StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Add New Item',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: VSizes.spaceBtwItems),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Item Name'),
                      validator: VValidator.validateEmpty,
                    ),
                    const SizedBox(height: VSizes.spaceBtwInputFields),
                    TextFormField(
                      controller: quantityController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: VValidator.validateDoubleNumber,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,2}'),
                        ),
                      ],
                      decoration: const InputDecoration(labelText: 'Quantity'),
                    ),
                    const SizedBox(height: VSizes.spaceBtwInputFields),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: buyingPriceController,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            validator: VValidator.validateDoubleNumber,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d{0,2}')),
                            ],
                            decoration: const InputDecoration(
                                labelText: 'Buying Price'),
                          ),
                        ),
                        const SizedBox(width: VSizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            controller: sellingPriceController,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            validator: VValidator.validateDoubleNumber,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d{0,2}')),
                            ],
                            decoration: const InputDecoration(
                                labelText: 'Selling Price'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: VSizes.spaceBtwSections),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => context.pop(),
                            child: const Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: VSizes.spaceBtwItems),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                final name = nameController.text.trim();
                                final buyingPrice = double.tryParse(
                                        buyingPriceController.text) ??
                                    0;
                                final sellingPrice = double.tryParse(
                                        sellingPriceController.text) ??
                                    0;
                                final quantity =
                                    double.tryParse(quantityController.text) ??
                                        1;

                                if (name.isEmpty ||
                                    buyingPrice <= 0 ||
                                    sellingPrice <= 0) {
                                  VToast.error(
                                      message:
                                          'Please fill all the fields correctly');
                                  return;
                                }

                                ref
                                    .read(buyNotifierProvider.notifier)
                                    .addTemporaryNewItem(
                                      name: name,
                                      buyingPrice: buyingPrice,
                                      sellingPrice: sellingPrice,
                                      quantity: quantity,
                                    );

                                context.pop();
                                context.pop();
                                VToast.success(
                                    message: 'Item added successfully');
                              }
                            },
                            child: const Text('Add'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
}
