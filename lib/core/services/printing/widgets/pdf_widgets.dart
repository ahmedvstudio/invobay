import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';

import '../../../database/app_database.dart';

pw.Widget buildHeader() => pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(height: 1 * PdfPageFormat.cm),
        pw.Text(
          'فاتورة البيع',
          style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 1 * PdfPageFormat.cm),
      ],
    );

pw.Widget buildTitle() => pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'التاريخ: ${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now())}',
        ),
        pw.SizedBox(height: 0.8 * PdfPageFormat.cm),
      ],
    );

pw.Widget buildInvoice(
    List<SellReceiptItemsModel> items, List<Item> itemDetailsList) {
  final headers = [
    'المنتج',
    'الكمية',
    'السعر',
    'الإجمالي',
  ];

  final data = items.asMap().entries.map((entry) {
    final index = entry.key;
    final item = entry.value;
    final itemDetails = itemDetailsList[index];

    return [
      itemDetails.name,
      '${item.quantity}',
      '\$${item.price.toStringAsFixed(2)}',
      '\$${(item.price * item.quantity).toStringAsFixed(2)}',
    ];
  }).toList();

  return pw.TableHelper.fromTextArray(
    headers: headers,
    data: data,
    border: null,
    headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
    headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
    cellHeight: 30,
    cellAlignments: {
      0: pw.Alignment.centerRight,
      1: pw.Alignment.center,
      2: pw.Alignment.center,
      3: pw.Alignment.center,
    },
    columnWidths: {
      0: const pw.FlexColumnWidth(2),
      1: const pw.FlexColumnWidth(1),
      2: const pw.FlexColumnWidth(1),
      3: const pw.FlexColumnWidth(1),
    },
  );
}

pw.Widget buildTotal(double totalPrice) {
  return pw.Container(
    alignment: pw.Alignment.centerLeft,
    child: pw.Row(
      children: [
        pw.Spacer(flex: 6),
        pw.Expanded(
          flex: 4,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Divider(),
              buildText(
                title: 'الإجمالي',
                value: '\$${totalPrice.toStringAsFixed(2)}',
                titleStyle: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
                unite: true,
              ),
              pw.SizedBox(height: 2 * PdfPageFormat.mm),
              pw.Container(height: 1, color: PdfColors.grey400),
              pw.SizedBox(height: 0.5 * PdfPageFormat.mm),
              pw.Container(height: 1, color: PdfColors.grey400),
            ],
          ),
        ),
      ],
    ),
  );
}

pw.Widget buildFooter() => pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.Divider(),
        pw.SizedBox(height: 2 * PdfPageFormat.mm),
        pw.Text('شكراً لتسوقكم معنا', textAlign: pw.TextAlign.center),
      ],
    );

pw.Widget buildText({
  required String title,
  required String value,
  double width = double.infinity,
  pw.TextStyle? titleStyle,
  bool unite = false,
}) {
  final style = titleStyle ?? pw.TextStyle(fontWeight: pw.FontWeight.bold);

  return pw.Container(
    width: width,
    child: pw.Row(
      children: [
        pw.Expanded(child: pw.Text(title, style: style)),
        pw.Text(value, style: unite ? style : null),
      ],
    ),
  );
}
