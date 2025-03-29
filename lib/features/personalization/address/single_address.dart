import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

class VSingleAddress extends StatelessWidget {
  const VSingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return VRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(VSizes.md),
      backgroundColor: selectedAddress
          ? VColors.primary.withValues(alpha: 0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : isDark
              ? VColors.darkerGrey
              : VColors.grey,
      margin: const EdgeInsets.only(bottom: VSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle : null,
              color: selectedAddress
                  ? isDark
                      ? VColors.light
                      : VColors.dark.withValues(alpha: 0.6)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: VSizes.sm / 2),
              const Text(
                '+1 234 567 890',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: VSizes.sm / 2),
              const Text(
                '02356 Timmy Street, New York, NY 10001, USA',
                softWrap: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
