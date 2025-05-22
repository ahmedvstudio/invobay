import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> summaryPrint(
  BuildContext context, {
  required double inventoryValue,
  required double totalSales,
  required double totalBuy,
  required double totalReturn,
  required double profit,
  required String currencySign,
}) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('Summary Report',
              style:
                  pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 20),
          pw.Text(
              'Inventory Value: $currencySign${inventoryValue.toStringAsFixed(2)}'),
          pw.Text('Sales: $currencySign${totalSales.toStringAsFixed(2)}'),
          pw.Text('Buy: $currencySign${totalBuy.toStringAsFixed(2)}'),
          pw.Text('Returns: $currencySign${totalReturn.toStringAsFixed(2)}'),
          pw.Text('Profit / Loss: $currencySign${profit.toStringAsFixed(2)}'),
        ],
      ),
    ),
  );

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
