import 'package:invobay/core/services/printing/widgets/text_widget.dart';

import '../../../database/drift/app_database.dart';
import '../../../utils/formatters/formatters.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget invoiceInfo({
  required SellReceiptsModel receipt,
  required SellPaymentsModel payment,
}) {
  final currentYear = DateTime.now().year;
  final formattedId = receipt.id.toString().padLeft(4, '0');

  final titles = <String>[
    'رقم الفاتوة:',
    'تاريخ الفاتورة:',
    'طريقة الدفع:',
    'حالة الفاتورة:'
  ];
  final data = <String>[
    '$currentYear-$formattedId',
    VFormatters.formatDates(receipt.date),
    payment.paymentMethod,
    payment.status,
  ];

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.end,
    children: List.generate(titles.length, (index) {
      final title = titles[index];
      final value = data[index];

      return buildText(title: title, value: value, width: 200);
    }),
  );
}
