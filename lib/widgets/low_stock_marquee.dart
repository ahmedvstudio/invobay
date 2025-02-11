import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class LowStockMarquee extends StatelessWidget {
  final String text;
  const LowStockMarquee({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: Marquee(
        text: text,
        style: const ArabicTextStyle(arabicFont: ArabicFont.dubai),
        scrollAxis: Axis.horizontal,
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        blankSpace: 20.0,
        velocity: 50.0,
        startPadding: 10.0,
      ),
    );
  }
}
