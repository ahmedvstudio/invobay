import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import '../models/sell_model.dart';

class ReceiptPrinter {
  static Future<void> printReceipt({
    required BuildContext context,
    required List<SellItem> items,
    required double totalPrice,
    required String customerName,
    String title = 'Receipt',
    String? footerNote, // Optional footer note
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // 🧾 Title
            pw.Text(title,
                style:
                    pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),

            // 📌 Customer & Date Info
            pw.Text('Customer: $customerName'),
            pw.Text(
                'Date: ${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now())}'),
            pw.SizedBox(height: 10),

            pw.Divider(),

            // 📜 Items List
            ...items.map(
              (item) => pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('${item.item.name} x${item.quantity}'),
                  pw.Text(
                      '\$${(item.item.sellingPrice * item.quantity).toStringAsFixed(2)}'),
                ],
              ),
            ),

            pw.Divider(),

            // 💰 Total Price
            pw.Text(
              'Total: \$${totalPrice.toStringAsFixed(2)}',
              style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
            ),

            if (footerNote != null) ...[
              pw.SizedBox(height: 10),
              pw.Divider(),
              pw.Text(footerNote, textAlign: pw.TextAlign.center),
            ],
          ],
        ),
      ),
    );

    // 🖨️ Print / Share the receipts
    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
  }
}
