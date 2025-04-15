import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

pw.Widget buildWatermark(String text, {double fontSize = 60}) {
  return pw.Positioned.fill(
    child: pw.Center(
      child: pw.Transform.rotate(
        angle: -0.3,
        child: pw.Opacity(
          opacity: 0.08, // Soft and subtle
          child: pw.Text(
            text,
            textDirection: pw.TextDirection.rtl,
            style: pw.TextStyle(
              fontSize: fontSize,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.grey600,
            ),
          ),
        ),
      ),
    ),
  );
}
