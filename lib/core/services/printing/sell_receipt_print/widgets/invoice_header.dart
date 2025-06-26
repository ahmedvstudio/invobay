import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../database/drift/app_database.dart';
import '../../../../database/hive/shop_details/shop_details.dart';
import 'invoice_customer_info.dart';
import 'invoice_info.dart';
import 'invoice_shop_info.dart';

pw.Widget invoHeader({
  required BuildContext context,
  required SellReceiptsModel receipt,
  required SellPaymentsModel payment,
  CustomerData? customerData,
  ShopDetail? shopDetail,
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
            shopDetail: shopDetail,
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
          invoiceInfo(receipt: receipt, payment: payment, context: context),
        ],
      ),
    ],
  );
}
