import 'package:invobay/core/services/printing/sell_receipt_print/widgets/text_widget.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget invoFooter({required String shopAddress}) => pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.Divider(),
        pw.SizedBox(height: 2 * PdfPageFormat.mm),
        buildText(
          title: 'شكراً لتسوقكم معنا.',
          value: shopAddress,
          titleStyle: pw.TextStyle(
            fontSize: 12,
            fontWeight: pw.FontWeight.bold,
          ),
          unite: false,
        ),
      ],
    );
