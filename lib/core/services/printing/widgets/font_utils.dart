import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../utils/constants/font_strings.dart';

class Fonts {
  final pw.Font regularFont;
  final pw.Font boldFont;

  Fonts(this.regularFont, this.boldFont);
}

Future<Fonts> loadFonts() async {
  final regularFont = pw.Font.ttf(await rootBundle.load(VFonts.sansRegular));
  final boldFont = pw.Font.ttf(await rootBundle.load(VFonts.sansBold));

  return Fonts(regularFont, boldFont);
}
