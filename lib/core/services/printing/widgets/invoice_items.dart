import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../database/drift/app_database.dart';

pw.Widget invoiceItems(List<SellReceiptItemsModel> items,
    List<Item> itemDetailsList, String currencySign) {
  final headers = [
    'الملاحظات',
    'المبلغ الكلي',
    'سعر المفرد',
    'الكمية',
    'الوصف',
    '#',
  ];

  final data = items.asMap().entries.map((entry) {
    final index = entry.key;
    final item = entry.value;
    final itemDetails = itemDetailsList[index];

    return [
      '', //  الملاحظات
      '${item.price * item.quantity}', // الإجمالي
      '${VFormatters.formatPrice(item.price)}', // السعر
      '${item.quantity}', // الكمية
      itemDetails.name, // المنتج
      '${index + 1}',
    ];
  }).toList();

  return pw.TableHelper.fromTextArray(
    headers: headers,
    data: data,
    border: pw.TableBorder.symmetric(
      outside: const pw.BorderSide(color: PdfColors.black),
      inside: const pw.BorderSide(color: PdfColors.grey300),
    ),
    headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
    headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
    cellHeight: 30,
    cellAlignments: {
      0: pw.Alignment.center,
      1: pw.Alignment.center,
      2: pw.Alignment.center,
      3: pw.Alignment.center,
      4: pw.Alignment.centerRight,
      5: pw.Alignment.center,
    },
    columnWidths: {
      0: const pw.FlexColumnWidth(1),
      1: const pw.FlexColumnWidth(1),
      2: const pw.FlexColumnWidth(1),
      3: const pw.FlexColumnWidth(1),
      4: const pw.FlexColumnWidth(2),
      5: const pw.FixedColumnWidth(30)
    },
  );
}
