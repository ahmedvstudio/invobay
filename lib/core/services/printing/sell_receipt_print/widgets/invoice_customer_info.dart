import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../database/drift/app_database.dart';

pw.Widget invoCustomerInfo({CustomerData? customerData}) {
  final customerComponents = [
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
      pw.Row(
        children: [
          pw.Text(
              VFormatters.formatPhoneNumber(customerData?.phoneNumber ?? '')),
          if (customerData?.extraPhoneNumber != null &&
              customerData?.extraPhoneNumber != '') ...[
            pw.Text(', '),
            pw.Text(VFormatters.formatPhoneNumber(
                customerData?.extraPhoneNumber ?? '')),
          ],
        ],
      ),
      pw.Text(address),
    ],
  );
}
