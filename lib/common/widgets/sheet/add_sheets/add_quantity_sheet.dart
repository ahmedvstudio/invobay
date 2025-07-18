import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

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
                    context.loc.addQuantity,
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
                    decoration: InputDecoration(
                      labelText: context.loc.quantity,
                      hintText: context.loc.enterQuantity,
                    ),
                    onChanged: (value) =>
                        ref.read(addQuantityProvider.notifier).state = value,
                  ),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            quantityState.state = '';
                            context.pop();
                          },
                          child: Text(context.loc.cancel),
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
                                      VSnackbar.error(error);
                                    } else {
                                      quantityState.state = '';
                                      context.pop();
                                    }
                                  }
                                }
                              : null,
                          child: Text(context.loc.add),
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
