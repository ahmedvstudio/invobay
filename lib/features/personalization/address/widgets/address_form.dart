import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/validators/validation.dart';

class AddressForm extends ConsumerWidget {
  const AddressForm({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.streetController,
    required this.postalCodeController,
    required this.cityController,
    required this.stateController,
    required this.countryController,
    this.descriptionController,
    this.onPressed,
    required this.buttonText,
    this.withDescription = false,
    this.currencySign = false,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController streetController;
  final TextEditingController postalCodeController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController countryController;
  final TextEditingController? descriptionController;
  final VoidCallback? onPressed;
  final String buttonText;
  final bool withDescription;
  final bool currencySign;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.user),
            labelText: 'Name',
          ),
          validator: VValidator.validateEmpty,
        ),
        const SizedBox(height: VSizes.spaceBtwInputFields),
        TextFormField(
          controller: phoneController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.mobile),
            labelText: 'Phone Number',
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: VSizes.spaceBtwInputFields),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: streetController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.building_31),
                  labelText: 'Street',
                ),
              ),
            ),
            const SizedBox(width: VSizes.spaceBtwInputFields),
            currencySign
                ? Expanded(
                    child: TextFormField(
                      controller: postalCodeController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.dollar_circle),
                        labelText: 'Currency',
                      ),
                    ),
                  )
                : Expanded(
                    child: TextFormField(
                      controller: postalCodeController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.code),
                        labelText: 'Postal Code',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwInputFields),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: cityController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.building),
                  labelText: 'City',
                ),
              ),
            ),
            const SizedBox(width: VSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                controller: stateController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.activity),
                  labelText: 'State',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwInputFields),
        TextFormField(
          controller: countryController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.global),
            labelText: 'Country',
          ),
        ),
        const SizedBox(height: VSizes.spaceBtwInputFields),
        if (withDescription) ...[
          TextFormField(
            controller: descriptionController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.note),
              labelText: 'Description',
            ),
            minLines: 5,
            maxLines: 7,
          ),
          const SizedBox(height: VSizes.defaultSpace),
        ],
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(buttonText),
          ),
        ),
      ],
    );
  }
}
