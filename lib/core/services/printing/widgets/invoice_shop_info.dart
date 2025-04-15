import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget invoShopInfo({
  required String shopName,
  required String shopNumber,
}) =>
    pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(shopName, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 1 * PdfPageFormat.mm),
        pw.Text(shopNumber),
      ],
    );
