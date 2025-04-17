import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../database/hive/shop_details/shop_details.dart';

pw.Widget invoShopInfo({
  ShopDetail? shopDetail,
}) =>
    pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(shopDetail?.name ?? 'Your Shop',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 1 * PdfPageFormat.mm),
        pw.Text(shopDetail?.phone ?? ''),
        pw.Text(shopDetail?.description ?? ''),
      ],
    );
