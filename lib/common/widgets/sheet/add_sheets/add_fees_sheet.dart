import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../core/providers/common_providers/default_providers.dart';
import '../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../styles/spacing_style.dart';

Future<void> showEditFeeBottomSheet(BuildContext context, WidgetRef ref) async {
  final shippingFee = ref.watch(shippingFeeProvider);
  final taxFee = ref.watch(taxFeeProvider);
  final shippingController =
      TextEditingController(text: shippingFee.toString());
  final taxController = TextEditingController(text: taxFee.toString());
  final currencySign = ref.watch(currencySignProvider);

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => Padding(
      padding: VSpacingStyle.responseKeyboard(context),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(context.loc.addFees,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: VSizes.spaceBtwSections),

              // Shipping Fee
              TextField(
                controller: shippingController,
                decoration: InputDecoration(
                  labelText: context.loc.shippingFee,
                  suffixText: currencySign,
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                ],
              ),
              const SizedBox(height: VSizes.spaceBtwInputFields),

              // Tax Fee
              TextField(
                controller: taxController,
                decoration: InputDecoration(
                  labelText: context.loc.taxFee,
                  suffixText: '%',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                ],
              ),
              const SizedBox(height: VSizes.spaceBtwSections),

              // Action Buttons
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
                      onPressed: () {
                        final newShippingFee =
                            double.tryParse(shippingController.text) ?? 0.0;
                        final newTaxFee =
                            double.tryParse(taxController.text) ?? 0.0;

                        ref.read(shippingFeeProvider.notifier).state =
                            newShippingFee;
                        ref.read(taxFeeProvider.notifier).update(newTaxFee);

                        context.pop();
                      },
                      child: Text(context.loc.save),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: VSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
    ),
  );
}
