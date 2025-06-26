import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../core/providers/vault_providers/vault_related_providers.dart';
import '../../../styles/spacing_style.dart';

Future<void> showVaultEditBottomSheet(
  BuildContext context,
  WidgetRef ref,
  int vaultId,
  double currentAmount,
) async {
  final controller = TextEditingController(text: currentAmount.toString());
  final formKey = GlobalKey<FormState>();

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: VSpacingStyle.responseKeyboard(context),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.loc.editVaultBalance,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: VSizes.spaceBtwItems),
              TextFormField(
                controller: controller,
                textAlign: TextAlign.center,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                ],
                decoration: InputDecoration(
                  labelText: context.loc.amount,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.loc.pleaseEnterAmount;
                  }
                  final parsed = double.tryParse(value);
                  if (parsed == null || parsed < 0) {
                    return context.loc.enterValidPositiveNumber;
                  }
                  return null;
                },
              ),
              const SizedBox(height: VSizes.spaceBtwItems),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => context.pop(),
                      child: Text(context.loc.cancel),
                    ),
                  ),
                  const SizedBox(width: VSizes.spaceBtwItems),
                  Expanded(
                    child: ElevatedButton(
                      child: Text(context.loc.update),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final newAmount = double.parse(controller.text);
                          ref
                              .read(
                                  vaultDetailNotifierProvider(vaultId).notifier)
                              .updateAmountOnHand(vaultId, newAmount);
                          context.pop();
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: VSizes.defaultSpace),
            ],
          ),
        ),
      );
    },
  );
}
