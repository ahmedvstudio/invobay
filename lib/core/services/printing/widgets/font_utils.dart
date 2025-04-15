import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../utils/constants/font_strings.dart';

class InvoFonts {
  final pw.Font regularFont;
  final pw.Font boldFont;
  final pw.Font italicFont;
  final pw.Font boldItalicFont;

  InvoFonts(
      this.regularFont, this.boldFont, this.italicFont, this.boldItalicFont);
}

Future<InvoFonts> loadFonts() async {
  final regularFont = pw.Font.ttf(await rootBundle.load(VFonts.cairoMedium));
  final boldFont = pw.Font.ttf(await rootBundle.load(VFonts.cairoBold));
  final italicFont = pw.Font.ttf(await rootBundle.load(VFonts.poppinsItalic));
  final boldItalicFont =
      pw.Font.ttf(await rootBundle.load(VFonts.poppinsSemiBold));

  return InvoFonts(regularFont, boldFont, italicFont, boldItalicFont);
}
