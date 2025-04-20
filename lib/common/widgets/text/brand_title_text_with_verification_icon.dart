import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/enums.dart';
import '../../../core/utils/constants/sizes.dart';
import 'brand_title_text.dart';

class VBrandTitleTextWithVerificationIcon extends StatelessWidget {
  const VBrandTitleTextWithVerificationIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = VColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSizes = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: VBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSizes: brandTextSizes,
          ),
        ),
        const SizedBox(width: VSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: VSizes.iconXs)
      ],
    );
  }
}
