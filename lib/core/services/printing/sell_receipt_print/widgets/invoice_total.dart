import 'package:invobay/core/services/printing/sell_receipt_print/widgets/text_widget.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../database/drift/app_database.dart';

pw.Widget invoTotalSection({
  required SellReceiptsModel receipt,
  required SellPaymentsModel payment,
  required String currencySign,
}) {
  return pw.Container(
    alignment: pw.Alignment.centerLeft,
    child: pw.Row(
      children: [
        pw.Expanded(
          flex: 4,
          child: pw.Column(
            children: [
              if (payment.debtAmount > 0) ...[
                buildText(
                  title: 'المبلغ المدفوع',
                  value:
                      '$currencySign ${VFormatters.formatPrice(payment.paidAmount)}',
                  unite: true,
                ),
                buildText(
                  title: 'المبلغ المتبقي',
                  value:
                      '$currencySign ${VFormatters.formatPrice(payment.debtAmount)}',
                  unite: true,
                ),
              ],
            ],
          ),
        ),
        pw.Spacer(flex: 6),
        pw.Expanded(
          flex: 4,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              if (receipt.totalPrice != receipt.subTotalPrice) ...[
                buildText(
                  title: 'المجموع',
                  value: '$currencySign ${receipt.subTotalPrice}',
                  unite: true,
                ),
                if (receipt.discount > 0)
                  buildText(
                    title: 'الخصم %',
                    value: '% ${receipt.discount}',
                    unite: true,
                  ),
                if (receipt.taxFee > 0)
                  buildText(
                    title: 'الضريبة',
                    value: '$currencySign ${receipt.taxFee}',
                    unite: true,
                  ),
                if (receipt.shippingFee > 0)
                  buildText(
                    title: 'اجور التوصيل',
                    value: '$currencySign ${receipt.shippingFee}',
                    unite: true,
                  ),
                pw.Divider(),
              ],
              buildText(
                title: 'الاجمالي',
                value:
                    '$currencySign ${VFormatters.formatPrice(receipt.totalPrice)}',
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
