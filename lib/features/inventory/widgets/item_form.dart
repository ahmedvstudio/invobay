import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';
import '../../../core/utils/validators/validation.dart';

class ItemForm extends StatelessWidget {
  const ItemForm(
      {super.key,
      this.nameController,
      this.quantityController,
      this.buyingPriceController,
      this.sellingPriceController,
      this.supplierController,
      this.barcodeController,
      this.descriptionController,
      this.onPressed,
      required this.buttonText});

  final TextEditingController? nameController;
  final TextEditingController? quantityController;
  final TextEditingController? buyingPriceController;
  final TextEditingController? sellingPriceController;
  final TextEditingController? supplierController;
  final TextEditingController? barcodeController;
  final TextEditingController? descriptionController;
  final VoidCallback? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: VSizes.spaceBtwInputFields,
      children: [
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Name'),
          validator: VValidator.validateEmpty,
        ),
        TextFormField(
          maxLength: 13,
          controller: quantityController,
          decoration:
              const InputDecoration(labelText: 'Quantity', counterText: ''),
          keyboardType: TextInputType.number,
          validator: VValidator.validateNumber,
        ),
        Row(
          children: [
            Flexible(
              child: TextFormField(
                controller: buyingPriceController,
                maxLength: 13,
                decoration: const InputDecoration(
                    labelText: 'Buying Price', counterText: ''),
                keyboardType: TextInputType.number,
                validator: VValidator.validateNumber,
              ),
            ),
            const SizedBox(width: VSizes.spaceBtwInputFields),
            Flexible(
              child: TextFormField(
                maxLength: 13,
                controller: sellingPriceController,
                decoration: const InputDecoration(
                    labelText: 'Selling Price', counterText: ''),
                keyboardType: TextInputType.number,
                validator: (value) => VValidator.validateSellingPrice(
                    value, buyingPriceController!.text),
              ),
            ),
          ],
        ),
        TextFormField(
          controller: supplierController,
          maxLength: 25,
          decoration:
              const InputDecoration(labelText: 'Supplier', counterText: ''),
        ),
        TextFormField(
          controller: barcodeController,
          decoration: InputDecoration(
            labelText: 'Barcode',
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
          decoration: const InputDecoration(
            labelText: 'Description',
            border: OutlineInputBorder(),
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
