import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import 'package:invobay/features/inventory/widgets/item_form.dart';
// Import Riverpod provider
import 'package:invobay/core/database/drift/app_database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod

import '../../../common/widgets/appbar/custom_appbar.dart';
import '../../../core/providers/item_providers/item_related_providers.dart';
import '../../../core/utils/constants/sizes.dart';

class EditItemScreen extends ConsumerWidget {
  final int itemId;

  EditItemScreen({super.key, required this.itemId});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _sellingPriceController = TextEditingController();
  final TextEditingController _buyingPriceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _barcodeController = TextEditingController();
  final TextEditingController _itemUnitController = TextEditingController();

  void _loadItemData(BuildContext context, WidgetRef ref) {
    final itemProvider = ref.watch(itemNotifierProvider);

    final item = itemProvider.firstWhere((item) => item.id == itemId);
    _nameController.text = item.name;
    _quantityController.text = item.quantity.toString();
    _sellingPriceController.text = item.sellingPrice.toString();
    _buyingPriceController.text = item.buyingPrice.toString();
    _descriptionController.text = item.description ?? '';
    _barcodeController.text = item.barcode ?? '';
    _itemUnitController.text =
        VHelperFunctions.getUnitLabel(context, item.itemUnit ?? '');
  }

  final _formKey = GlobalKey<FormState>();

  void _updateItem(BuildContext context, WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      final updatedItem = ItemsCompanion(
        id: drift.Value(itemId),
        name: drift.Value(_nameController.text),
        quantity: drift.Value(double.parse(_quantityController.text)),
        sellingPrice: drift.Value(double.parse(_sellingPriceController.text)),
        buyingPrice: drift.Value(double.parse(_buyingPriceController.text)),
        description: drift.Value(_descriptionController.text),
        barcode: drift.Value(_barcodeController.text),
        itemUnit: drift.Value(VHelperFunctions.getOriginalUnit(
            context, _itemUnitController.text)),
      );

      final provider = ref.read(itemNotifierProvider.notifier);
      provider.updateItem(updatedItem);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _loadItemData(context, ref);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            VCustomAppBar(
              text: context.loc.editItem,
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
                      barcodeController: _barcodeController,
                      descriptionController: _descriptionController,
                      itemUnitController: _itemUnitController,
                      onPressed: () => _updateItem(context, ref),
                      buttonText: context.loc.updateItem,
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
