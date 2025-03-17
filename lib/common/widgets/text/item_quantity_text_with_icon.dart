import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/enums.dart';
import '../../../core/utils/constants/sizes.dart';
import 'brand_title_text.dart';

class VItemQuantityTextWithIcon extends StatelessWidget {
  const VItemQuantityTextWithIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = VColors.kPrimary,
    this.textAlign = TextAlign.center,
    this.itemTextSizes = TextSizes.medium,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes itemTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Iconsax.box, color: iconColor, size: VSizes.iconSm),
        const SizedBox(width: VSizes.xs),
        Flexible(
          child: VBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSizes: itemTextSizes,
          ),
        ),
      ],
    );
  }
}
