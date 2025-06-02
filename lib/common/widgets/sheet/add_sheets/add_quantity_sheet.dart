import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/styles/spacing_style.dart';

import '../../../../core/providers/common_providers/default_providers.dart';
import '../../../../core/providers/item_providers/item_related_providers.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/messages/snackbar.dart';

Future<void> showAddQuantityBottomSheet(BuildContext context, WidgetRef ref,
    {required int? itemId}) async {
  final quantityState = ref.read(addQuantityProvider.notifier);
  quantityState.state = '';

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: VSpacingStyle.responseKeyboard(context),
          child: Consumer(
            builder: (context, ref, _) {
              final quantityInput = ref.watch(addQuantityProvider).trim();
              final isValid =
                  RegExp(r'^\d+(\.\d{0,2})?$').hasMatch(quantityInput) &&
                      double.tryParse(quantityInput) != null &&
                      double.parse(quantityInput) > 0;

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Quantity',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: VSizes.spaceBtwInputFields),
                  TextField(
                    autofocus: true,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                      hintText: 'Enter quantity (e.g. 2.5)',
                    ),
                    onChanged: (value) =>
                        ref.read(addQuantityProvider.notifier).state = value,
                  ),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            quantityState.state = '';
                            context.pop();
                          },
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: VSizes.spaceBtwItems),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: isValid
                              ? () async {
                                  final qty = double.parse(quantityInput);
                                  final error = await ref
                                      .read(itemNotifierProvider.notifier)
                                      .addQuantity(itemId, qty);
                                  if (context.mounted) {
                                    if (error != null) {
                                      VSnackbar.error(
                                          context: context, message: error);
                                    } else {
                                      quantityState.state = '';
                                      context.pop();
                                    }
                                  }
                                }
                              : null,
                          child: const Text('Add'),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}
