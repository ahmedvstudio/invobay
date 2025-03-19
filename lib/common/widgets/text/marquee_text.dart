import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:marquee/marquee.dart';

import '../../../core/utils/constants/colors.dart';

class MarqueeText extends StatelessWidget {
  const MarqueeText({
    super.key,
    required this.longText,
    this.isArabic = false,
    this.textColor = VColors.white,
    this.onTap,
    this.backgroundColor = VColors.error,
  });

  final String longText;
  final bool isArabic;
  final Color textColor;
  final VoidCallback? onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        width: double.infinity,
        height: VSizes.defaultSpace,
        child: Marquee(
          text: longText,
          style: isArabic
              ? ArabicTextStyle(arabicFont: ArabicFont.dubai, color: textColor)
              : Theme.of(context).textTheme.bodyMedium!.apply(color: textColor),
          scrollAxis: Axis.horizontal,
          textDirection: TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.start,
          blankSpace: 20.0,
          velocity: 50.0,
          startPadding: 10.0,
        ),
      ),
    );
  }
}
