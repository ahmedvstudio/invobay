import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:invobay/core/utils/constants/image_strings.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> generateAndPrintReportPDF({
  required String salesSummary,
  required String purchaseSummary,
  required String profitSummary,
  required List<String> topItems,
  required List<String> lowStockItems,
  required String returnSummary,
}) async {
  final pdf = pw.Document();

  // Load logo from assets (e.g., assets/images/logo.png)
  final Uint8List? logoBytes = await _loadAssetImage(VImages.appLogo);

  pdf.addPage(
    pw.MultiPage(
      build: (context) => [
        if (logoBytes != null)
          pw.Center(
            child: pw.Image(pw.MemoryImage(logoBytes), width: 80),
          ),
        pw.SizedBox(height: 10),
        pw.Center(
          child: pw.Text('Inventory Report',
              style:
                  pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold)),
        ),
        pw.Divider(),

        // Summary Sections
        _sectionTitle('📊 Sales Summary'),
        pw.Text(salesSummary),
        _sectionTitle('📦 Purchase Summary'),
        pw.Text(purchaseSummary),
        _sectionTitle('💰 Profit Summary'),
        pw.Text(profitSummary),
        _sectionTitle('🔝 Top Selling Items'),
        pw.Bullet(text: topItems.isEmpty ? 'No data' : topItems.join(', ')),
        _sectionTitle('⚠️ Low Stock Items'),
        pw.Bullet(
            text: lowStockItems.isEmpty ? 'No data' : lowStockItems.join(', ')),
        _sectionTitle('🔄 Return Summary'),
        pw.Text(returnSummary),

        pw.SizedBox(height: 20),

        // Simple Bar Chart Representation
        _sectionTitle('📈 Sales vs Purchases (Bar Chart)'),
        _barChart([
          {'label': 'Sales', 'value': 25000},
          {'label': 'Purchases', 'value': 15000},
        ]),
      ],
    ),
  );

  await Printing.layoutPdf(onLayout: (format) => pdf.save());
}

pw.Widget _sectionTitle(String text) {
  return pw.Padding(
    padding: const pw.EdgeInsets.only(top: 12, bottom: 4),
    child: pw.Text(text,
        style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
  );
}

pw.Widget _barChart(List<Map<String, dynamic>> data) {
  final maxVal =
      data.map((d) => d['value'] as num).reduce((a, b) => a > b ? a : b);
  return pw.Column(
    children: data.map((entry) {
      final label = entry['label'];
      final value = entry['value'] as num;
      final barWidth = (value / maxVal) * 200;

      return pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 4),
        child: pw.Row(
          children: [
            pw.SizedBox(width: 60, child: pw.Text(label)),
            pw.Container(
              width: barWidth,
              height: 12,
              color: PdfColors.blueAccent,
            ),
            pw.SizedBox(width: 10),
            pw.Text('₹${value.toStringAsFixed(0)}'),
          ],
        ),
      );
    }).toList(),
  );
}

Future<Uint8List?> _loadAssetImage(String path) async {
  try {
    return await rootBundle
        .load(path)
        .then((value) => value.buffer.asUint8List());
  } catch (_) {
    return null;
  }
}
