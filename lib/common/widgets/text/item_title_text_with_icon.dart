import 'package:flutter/material.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

class VItemTitleTextWithIcon extends StatelessWidget {
  const VItemTitleTextWithIcon({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 1,
    this.textAlign,
    this.iconColor = VColors.kAccent,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: VSizes.iconSm,
          backgroundColor: VColors.kPrimary,
          child: Text(title[0]),
        ),
        const SizedBox(width: VSizes.sm),
        Flexible(
          child: Text(
            title,
            style: smallSize
                ? Theme.of(context).textTheme.bodyMedium
                : Theme.of(context).textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLines,
            textAlign: textAlign,
          ),
        ),
      ],
    );
  }
}
