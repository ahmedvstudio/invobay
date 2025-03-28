import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/widgets/appbar/custom_appbar.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:drift/drift.dart' as drift;
import '../../../core/database/app_database.dart';
import '../../../core/providers/db_notifiers/app_providers.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/helpers/helper_functions.dart';
import '../widgets/item_form.dart';

class AddItemScreen extends ConsumerStatefulWidget {
  const AddItemScreen({super.key});

  @override
  AddItemScreenState createState() => AddItemScreenState();
}

class AddItemScreenState extends ConsumerState<AddItemScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _sellingPriceController = TextEditingController();
  final TextEditingController _buyingPriceController = TextEditingController();
  final TextEditingController _supplierController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _barcodeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _sellingPriceController.dispose();
    _buyingPriceController.dispose();
    _supplierController.dispose();
    _descriptionController.dispose();
    _barcodeController.dispose();
    super.dispose();
  }

  Future<void> _addItem() async {
    if (_formKey.currentState!.validate()) {
      final item = ItemsCompanion.insert(
        name: _nameController.text,
        quantity: double.parse(_quantityController.text),
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

      // Check if item exists
      final errorMessage =
          await ref.read(itemNotifierProvider.notifier).addItem(item);

      if (errorMessage != null) {
        if (!mounted) return;
        VHelperFunctions.showSnackBar(context: context, message: errorMessage);
        return;
      }

      // Clear the controllers
      _nameController.clear();
      _quantityController.clear();
      _sellingPriceController.clear();
      _buyingPriceController.clear();
      _supplierController.clear();
      _descriptionController.clear();
      _barcodeController.clear();

      if (!mounted) return;
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
                  ),
                )
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
                      onPressed: _addItem, // ✅ No need to pass context or ref
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
