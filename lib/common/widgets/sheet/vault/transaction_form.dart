import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/formatters/formatters.dart';
import '../../../../core/utils/validators/validation.dart';

class VTransactionForm extends StatelessWidget {
  const VTransactionForm({
    super.key,
    required this.selectedDate,
    required this.amountController,
    required this.descriptionController,
    required this.noteController,
    required this.title,
    this.onDatePicked,
    this.onDelete,
    this.onConfirm,
    this.isUpdate = true,
    this.formKey,
  });

  final DateTime selectedDate;
  final TextEditingController amountController;
  final TextEditingController descriptionController;
  final TextEditingController noteController;
  final String title;
  final VoidCallback? onDatePicked;
  final VoidCallback? onDelete;
  final VoidCallback? onConfirm;
  final bool isUpdate;
  final Key? formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(title,
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
              InkWell(
                onTap: onDatePicked,
                borderRadius: BorderRadius.circular(VSizes.sm),
                child: const Icon(
                  Iconsax.calendar,
                  color: VColors.info,
                ),
              ),
              if (isUpdate) ...[
                const SizedBox(width: VSizes.spaceBtwItems),
                InkWell(
                  onTap: onDelete,
                  borderRadius: BorderRadius.circular(VSizes.sm),
                  child: const Icon(
                    Iconsax.trash,
                    color: VColors.error,
                  ),
                ),
              ],
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              VFormatters.formatDate(selectedDate),
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          const SizedBox(height: VSizes.spaceBtwItems),
          TextFormField(
            controller: amountController,
            decoration: const InputDecoration(labelText: 'Amount'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            ],
            validator: VValidator.validateDoubleNumber,
          ),
          const SizedBox(height: VSizes.spaceBtwInputFields),
          TextFormField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
            validator: VValidator.validateEmpty,
          ),
          const SizedBox(height: VSizes.spaceBtwInputFields),
          TextFormField(
            controller: noteController,
            decoration: const InputDecoration(labelText: 'Note (optional)'),
            inputFormatters: [
              LengthLimitingTextInputFormatter(50),
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwItems),
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
                  onPressed: onConfirm,
                  child: Text(isUpdate ? "Update" : "Save"),
                ),
              ),
            ],
          ),
          const SizedBox(height: VSizes.defaultSpace),
        ],
      ),
    );
  }
}
