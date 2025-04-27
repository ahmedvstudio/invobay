import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';

class VSingleAddress extends StatelessWidget {
  const VSingleAddress({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.extraPhoneNumber,
    required this.address,
    required this.onTap,
    required this.isCustomer,
    this.deleteOnPressed,
  });
  final String name;
  final String phoneNumber;
  final String extraPhoneNumber;
  final String address;
  final VoidCallback onTap;
  final VoidCallback? deleteOnPressed;
  final bool isCustomer;

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: VRoundedContainer(
        width: double.infinity,
        showBorder: true,
        padding: const EdgeInsets.all(VSizes.md),
        backgroundColor: isCustomer
            ? VColors.primary.withValues(alpha: 0.3)
            : VColors.secondary.withValues(alpha: 0.3),
        borderColor: isDark ? VColors.darkerGrey : VColors.grey,
        margin: const EdgeInsets.only(bottom: VSizes.spaceBtwItems),
        child: Stack(
          children: [
            Positioned(
              right: -15,
              top: -15,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Iconsax.trash,
                  color: isDark
                      ? VColors.light
                      : VColors.dark.withValues(alpha: 0.6),
                ),
                onPressed: deleteOnPressed,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: VSizes.sm / 2),
                Text(VFormatters.formatPhoneNumber(phoneNumber),
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(VFormatters.formatPhoneNumber(extraPhoneNumber),
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: VSizes.sm / 2),
                Text(address, softWrap: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
