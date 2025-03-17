import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/widgets/appbar/custom_appbar.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;
import '../../../core/database/app_database.dart';
import '../../../core/providers/item_provider.dart';
import '../../../core/utils/constants/colors.dart';
import 'item_form.dart';

class AddItemScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _sellingPriceController = TextEditingController();
  final TextEditingController _buyingPriceController = TextEditingController();
  final TextEditingController _supplierController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _barcodeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  AddItemScreen({super.key});

  void _addItem(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final provider = Provider.of<ItemProvider>(context, listen: false);

      final item = ItemsCompanion.insert(
        name: _nameController.text,
        quantity: int.parse(_quantityController.text),
        sellingPrice: double.parse(_sellingPriceController.text),
        buyingPrice: double.parse(_buyingPriceController.text),
        supplierName: _supplierController.text.isEmpty
            ? const drift.Value('Supplier')
            : drift.Value(_supplierController.text),
        description: _descriptionController.text.isEmpty
            ? const drift.Value('Write a description about the item')
            : drift.Value(_descriptionController.text),
        barcode: _barcodeController.text.isEmpty
            ? const drift.Value.absent()
            : drift.Value(_barcodeController.text),
      );

      provider.addItem(item);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            VCustomAppBar(
              text: 'Add Item',
              showBackArrow: false,
              actions: [
                IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(
                      CupertinoIcons.xmark,
                      color: VColors.white,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(VSizes.defaultSpace),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ItemForm(
                      nameController: _nameController,
                      quantityController: _quantityController,
                      buyingPriceController: _buyingPriceController,
                      sellingPriceController: _sellingPriceController,
                      supplierController: _supplierController,
                      barcodeController: _barcodeController,
                      descriptionController: _descriptionController,
                      onPressed: () => _addItem(context),
                      buttonText: 'Add Item',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
