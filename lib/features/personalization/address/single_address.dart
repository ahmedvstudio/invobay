import 'package:flutter/material.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';

class VSingleAddress extends StatelessWidget {
  const VSingleAddress({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.onTap,
  });
  final String name;
  final String phoneNumber;
  final String address;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: VRoundedContainer(
        width: double.infinity,
        showBorder: true,
        padding: const EdgeInsets.all(VSizes.md),
        backgroundColor: VColors.primary.withValues(alpha: 0.3),
        borderColor: isDark ? VColors.darkerGrey : VColors.grey,
        margin: const EdgeInsets.only(bottom: VSizes.spaceBtwItems),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: VSizes.sm / 2),
            Text(phoneNumber, maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: VSizes.sm / 2),
            Text(address, softWrap: true),
          ],
        ),
      ),
    );
  }
}
