import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import 'item_unit_selector.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';
import '../../../core/utils/validators/validation.dart';

class ItemForm extends StatelessWidget {
  const ItemForm({
    super.key,
    this.nameController,
    this.quantityController,
    this.buyingPriceController,
    this.sellingPriceController,
    this.barcodeController,
    this.descriptionController,
    this.onPressed,
    required this.buttonText,
    required this.itemUnitController,
  });

  final TextEditingController? nameController;
  final TextEditingController? quantityController;
  final TextEditingController? buyingPriceController;
  final TextEditingController? sellingPriceController;
  final TextEditingController? barcodeController;
  final TextEditingController? descriptionController;
  final TextEditingController itemUnitController;
  final VoidCallback? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: VSizes.spaceBtwInputFields,
      children: [
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(labelText: context.loc.name),
          validator: (value) => VValidator.validateEmpty(context, value),
        ),
        Row(
          children: [
            Flexible(
              flex: 2,
              child: TextFormField(
                textAlign: TextAlign.center,
                maxLength: 8,
                controller: quantityController,
                decoration: InputDecoration(
                    labelText: context.loc.quantity, counterText: ''),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                ],
                validator: (value) =>
                    VValidator.validateDoubleNumber(context, value),
              ),
            ),
            const SizedBox(width: VSizes.spaceBtwInputFields),
            ItemUnitSelector(
              itemUnitController: itemUnitController,
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: TextFormField(
                controller: buyingPriceController,
                textAlign: TextAlign.center,
                maxLength: 8,
                decoration: InputDecoration(
                    labelText: context.loc.buyingPrice, counterText: ''),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                ],
                validator: (value) =>
                    VValidator.validateDoubleNumber(context, value),
              ),
            ),
            const SizedBox(width: VSizes.spaceBtwInputFields),
            Flexible(
              child: TextFormField(
                maxLength: 8,
                controller: sellingPriceController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelText: context.loc.sellingPrice, counterText: ''),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                ],
                validator: (value) => VValidator.validateSellingPrice(
                    context, value, buyingPriceController!.text),
              ),
            ),
          ],
        ),
        TextFormField(
          controller: barcodeController,
          decoration: InputDecoration(
            labelText: context.loc.barcode,
            suffixIcon: IconButton(
              onPressed: () => VHelperFunctions.scanBarcode(barcodeController!),
              icon: const Icon(
                Iconsax.barcode,
              ),
            ),
          ),
        ),
        TextFormField(
          controller: descriptionController,
          decoration: InputDecoration(
            labelText: context.loc.description,
            border: const OutlineInputBorder(),
          ),
          minLines: 5,
          maxLines: 7,
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(buttonText),
          ),
        ),
      ],
    );
  }
}
