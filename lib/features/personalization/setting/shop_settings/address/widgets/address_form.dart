import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/validators/validation.dart';

class AddressForm extends ConsumerWidget {
  const AddressForm({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.streetController,
    this.extraPhoneNumberController,
    required this.cityController,
    required this.stateController,
    required this.countryController,
    this.descriptionController,
    this.onPressed,
    required this.buttonText,
    this.withDescription = false,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController streetController;
  final TextEditingController? extraPhoneNumberController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController countryController;
  final TextEditingController? descriptionController;
  final VoidCallback? onPressed;
  final String buttonText;
  final bool withDescription;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Iconsax.user),
            labelText: context.loc.name,
          ),
          validator: VValidator.validateEmpty,
        ),
        const SizedBox(height: VSizes.spaceBtwInputFields),
        TextFormField(
          controller: phoneController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Iconsax.mobile),
            labelText: context.loc.phoneNumber,
            counterText: '',
          ),
          keyboardType: TextInputType.number,
          maxLength: 11,
        ),
        const SizedBox(height: VSizes.spaceBtwInputFields),
        TextFormField(
          controller: extraPhoneNumberController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Iconsax.mobile5),
            labelText: context.loc.phoneNumberOptional,
            counterText: '',
          ),
          keyboardType: TextInputType.number,
          maxLength: 11,
        ),
        const SizedBox(height: VSizes.spaceBtwInputFields),
        TextFormField(
          controller: streetController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Iconsax.building_31),
            labelText: context.loc.street,
          ),
        ),
        const SizedBox(height: VSizes.spaceBtwInputFields),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: cityController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.building),
                  labelText: context.loc.city,
                ),
              ),
            ),
            const SizedBox(width: VSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                controller: stateController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.activity),
                  labelText: context.loc.state,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwInputFields),
        TextFormField(
          controller: countryController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Iconsax.global),
            labelText: context.loc.country,
          ),
        ),
        const SizedBox(height: VSizes.spaceBtwInputFields),
        if (withDescription) ...[
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.note),
              labelText: context.loc.description,
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
