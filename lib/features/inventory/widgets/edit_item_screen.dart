import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/features/inventory/widgets/item_form.dart';
import 'package:provider/provider.dart';
import 'package:invobay/core/providers/item_provider.dart';
import 'package:invobay/core/database/app_database.dart';
import 'package:drift/drift.dart' as drift;

import '../../../common/widgets/appbar/custom_appbar.dart';
import '../../../core/utils/constants/sizes.dart';

class EditItemScreen extends StatelessWidget {
  final int itemId;

  EditItemScreen({super.key, required this.itemId});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _sellingPriceController = TextEditingController();
  final TextEditingController _buyingPriceController = TextEditingController();
  final TextEditingController _supplierController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _barcodeController = TextEditingController();

  void _loadItemData(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context, listen: false);
    final item = itemProvider.items.firstWhere((item) => item.id == itemId);

    _nameController.text = item.name;
    _quantityController.text = item.quantity.toString();
    _sellingPriceController.text = item.sellingPrice.toString();
    _buyingPriceController.text = item.buyingPrice.toString();
    _supplierController.text = item.supplierName ?? '';
    _descriptionController.text = item.description ?? '';
    _barcodeController.text = item.barcode ?? '';
  }

  final _formKey2 = GlobalKey<FormState>();

  void _updateItem(BuildContext context) {
    if (_formKey2.currentState!.validate()) {
      final updatedItem = ItemsCompanion(
        id: drift.Value(itemId),
        name: drift.Value(_nameController.text),
        quantity: drift.Value(int.parse(_quantityController.text)),
        sellingPrice: drift.Value(double.parse(_sellingPriceController.text)),
        buyingPrice: drift.Value(double.parse(_buyingPriceController.text)),
        supplierName: drift.Value(_supplierController.text),
        description: drift.Value(_descriptionController.text),
        barcode: _barcodeController.text.isEmpty
            ? const drift.Value.absent()
            : drift.Value(_barcodeController.text),
      );

      final provider = Provider.of<ItemProvider>(context, listen: false);
      provider.updateItem(updatedItem);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    _loadItemData(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            VCustomAppBar(
              text: 'Edit Item',
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
                key: _formKey2,
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
                      onPressed: () => _updateItem(context),
                      buttonText: 'Update Item',
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
