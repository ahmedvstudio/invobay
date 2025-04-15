import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../database/app_database.dart';
import 'invoice_customer_info.dart';
import 'invoice_info.dart';
import 'invoice_shop_info.dart';

pw.Widget invoHeader({
  required String shopName,
  required String shopNumber,
  required SellReceiptsModel receipt,
  required SellPaymentsModel payment,
  CustomerData? customerData,
}) {
  final currentYear = DateTime.now().year;
  final formattedId = receipt.id.toString().padLeft(4, '0');
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          invoShopInfo(
            shopName: shopName,
            shopNumber: shopNumber,
          ),
          pw.Container(
            height: 50,
            width: 50,
            child: pw.BarcodeWidget(
              barcode: pw.Barcode.qrCode(),
              data: '$currentYear-$formattedId',
            ),
          ),
        ],
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          /// --> Customer info
          invoCustomerInfo(customerData: customerData),

          /// --> Invoice info
          invoiceInfo(receipt: receipt, payment: payment),
        ],
      ),
    ],
  );
}
