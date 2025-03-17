import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import '../../../core/utils/constants/colors.dart';

class MarqueeText extends StatelessWidget {
  const MarqueeText({
    super.key,
    required this.longText,
    this.isArabic = false,
    this.textColor = VColors.white,
  });

  final String longText;
  final bool isArabic;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 20,
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
    );
  }
}
