import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import '../database/app_database.dart';

class ArabicReceiptPrinter {
  static Future<void> printReceipt({
    required BuildContext context,
    required List<SellReceiptItemsModel> items,
    required double totalPrice,
    required String customerName,
    String title = 'jhjhj',
    String? footerNote,
  }) async {
    final pdf = pw.Document();

    // 📝 Load custom Arabic font
    // final arabicFont = await PdfGoogleFonts.amiriRegular();
    // OR if you have font asset:
    final arabicFont = pw.Font.ttf(
        await rootBundle.load('assets/fonts/cairo/Cairo-Regular.ttf'));

    pdf.addPage(
      pw.Page(
        theme: pw.ThemeData.withFont(
          base: arabicFont,
        ),
        build: (pw.Context context) => pw.Directionality(
          textDirection: pw.TextDirection.rtl, // <-- Important for Arabic
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // 🧾 Title
              pw.Text(title,
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold)),

              pw.SizedBox(height: 5),

              // 📌 Customer & Date Info
              pw.Text('العميل: $customerName'),
              pw.Text(
                  'التاريخ: ${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now())}'),
              pw.SizedBox(height: 10),

              pw.Divider(),

              // 📜 Items List
              ...items.map(
                (item) => pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('${item.itemId} ×${item.quantity}'),
                    pw.Text(
                      '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                    ),
                  ],
                ),
              ),

              pw.Divider(),

              // 💰 Total Price
              pw.Text(
                'الإجمالي: \$${totalPrice.toStringAsFixed(2)}',
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),

              if (footerNote != null) ...[
                pw.SizedBox(height: 10),
                pw.Divider(),
                pw.Text(footerNote, textAlign: pw.TextAlign.center),
              ],
            ],
          ),
        ),
      ),
    );

    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
  }
}
