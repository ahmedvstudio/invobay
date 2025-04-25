import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/common_providers/default_providers.dart';
import '../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../core/utils/constants/sizes.dart';

void showEditFeeDialog(
    BuildContext context, WidgetRef ref, double shippingFee, double taxFee) {
  final shippingController =
      TextEditingController(text: shippingFee.toString());
  final taxController = TextEditingController(text: taxFee.toString());
  final currencySign = ref.watch(currencySignProvider);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Edit Fees'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: shippingController,
              decoration: InputDecoration(
                labelText: 'Shipping Fee',
                suffix: Text(currencySign),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(
                    r'^\d*\.?\d{0,2}')), // Allow numbers with up to two decimal places
              ],
            ),
            const SizedBox(height: VSizes.spaceBtwInputFields),
            TextField(
              controller: taxController,
              decoration: const InputDecoration(
                labelText: 'Tax Fee',
                suffix: Text('%'),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(
                    r'^\d*\.?\d{0,2}')), // Allow numbers with up to two decimal places
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Update the shipping fee and tax fee providers with new values
              final newShippingFee =
                  double.tryParse(shippingController.text) ?? 0.0;
              final newTaxFee = double.tryParse(taxController.text) ?? 0.0;

              ref.read(shippingFeeProvider.notifier).state = newShippingFee;
              ref.read(taxFeeProvider.notifier).update(newTaxFee);

              context.pop();
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}
