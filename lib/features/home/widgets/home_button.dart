import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/common/widgets/custom_shapes/containers/rounded_container.dart';

import '../../../core/providers/theme_providers/theme_related_providers.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

class VHomeButton extends ConsumerWidget {
  const VHomeButton({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = ref.watch(primaryColorProvider);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(VSizes.cardRadiusLg),
      child: VRoundedContainer(
        borderColor: VColors.borderPrimary,
        showBorder: true,
        padding: const EdgeInsets.all(VSizes.spaceBtwItems),
        backgroundColor: primaryColor.withValues(alpha: 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Icon(
              icon,
              size: VSizes.iconLg,
              color: primaryColor.withValues(alpha: 0.8),
            ),
          ],
        ),
      ),
    );
  }
}
