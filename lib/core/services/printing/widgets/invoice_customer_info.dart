import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../database/drift/app_database.dart';

pw.Widget invoCustomerInfo({CustomerData? customerData}) {
  final customerComponents = [
    customerData?.extraPhoneNumber,
    customerData?.street,
    customerData?.city,
    customerData?.state,
    customerData?.country,
  ];

  final address = customerComponents
      .where((component) => component != null && component.isNotEmpty)
      .join(', ');
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(
        customerData?.name ?? '',
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
      ),
      pw.Text(VFormatters.formatPhoneNumber(customerData?.phoneNumber ?? '')),
      pw.Text(address),
    ],
  );
}
