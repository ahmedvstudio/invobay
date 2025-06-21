import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/widgets/appbar/custom_appbar.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:drift/drift.dart' as drift;
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/messages/snackbar.dart';
import '../../../core/database/drift/app_database.dart';
import '../../../core/providers/item_providers/item_related_providers.dart';
import '../../../core/utils/constants/colors.dart';
import '../widgets/item_form.dart';

class AddItemScreen extends ConsumerStatefulWidget {
  const AddItemScreen({
    super.key,
    this.itemName,
  });
  final String? itemName;
  @override
  AddItemScreenState createState() => AddItemScreenState();
}

class AddItemScreenState extends ConsumerState<AddItemScreen> {
  late final TextEditingController _nameController;
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _sellingPriceController = TextEditingController();
  final TextEditingController _buyingPriceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _barcodeController = TextEditingController();
  final TextEditingController _itemUnitController =
      TextEditingController(text: '');

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.itemName == 'itemName' || widget.itemName == null
          ? ''
          : widget.itemName,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _sellingPriceController.dispose();
    _buyingPriceController.dispose();
    _descriptionController.dispose();
    _barcodeController.dispose();
    _itemUnitController.dispose();
    super.dispose();
  }

  Future<void> _addItem() async {
    if (_formKey.currentState!.validate()) {
      final item = ItemsCompanion.insert(
        name: _nameController.text,
        quantity: double.parse(_quantityController.text),
        sellingPrice: double.parse(_sellingPriceController.text),
        buyingPrice: double.parse(_buyingPriceController.text),
        description: _descriptionController.text.isEmpty
            ? const drift.Value.absent()
            : drift.Value(_descriptionController.text),
        barcode: _barcodeController.text.isEmpty
            ? const drift.Value.absent()
            : drift.Value(_barcodeController.text),
        itemUnit: _itemUnitController.text.isEmpty
            ? const drift.Value.absent()
            : drift.Value(_itemUnitController.text),
      );

      // Check if item exists
      final errorMessage =
          await ref.read(itemNotifierProvider.notifier).addItem(item);

      if (errorMessage != null) {
        if (!mounted) return;
        VSnackbar.error(errorMessage);
        return;
      }

      // Clear the controllers
      _nameController.clear();
      _quantityController.clear();
      _sellingPriceController.clear();
      _buyingPriceController.clear();
      _descriptionController.clear();
      _barcodeController.clear();
      _itemUnitController.clear();

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
              text: context.loc.addItem,
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
                      barcodeController: _barcodeController,
                      descriptionController: _descriptionController,
                      itemUnitController: _itemUnitController,
                      onPressed: _addItem,
                      buttonText: context.loc.addItem,
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
