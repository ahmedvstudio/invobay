import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

class VMetaDataSection extends StatelessWidget {
  const VMetaDataSection({
    super.key,
    required this.child,
    this.tag,
    this.icon = Iconsax.box,
    this.iconColor = VColors.kPrimary,
    this.tagBackgroundColor = VColors.kSecondary,
    this.tagTextColor = VColors.black,
    this.showTag = true,
    this.showIcon = true,
  });
  final bool showTag;
  final String? tag;
  final Color tagBackgroundColor;
  final Color tagTextColor;
  final IconData? icon;
  final Color iconColor;
  final Widget child;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showIcon) Icon(icon, size: VSizes.iconLg, color: iconColor),
        const SizedBox(width: VSizes.spaceBtwItems / 4),
        if (showTag)
          VRoundedContainer(
            radius: VSizes.sm,
            backgroundColor: tagBackgroundColor.withValues(alpha: 0.8),
            padding: const EdgeInsets.symmetric(
              horizontal: VSizes.sm,
              vertical: VSizes.xs,
            ),
            child: Text(
              tag!,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: tagTextColor),
            ),
          ),
        if (showTag) const SizedBox(width: VSizes.spaceBtwItems),
        Flexible(child: child),
      ],
    );
  }
}
