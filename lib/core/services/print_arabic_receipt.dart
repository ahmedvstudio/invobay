import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import '../database/app_database.dart';

import '../providers/customer_providers/customer_related_providers.dart';
import '../providers/item_providers/item_related_providers.dart';
import '../utils/constants/font_strings.dart';

class PrintArabicReceipt {
  static Future<void> printReceipt({
    required WidgetRef ref,
    required List<SellReceiptItemsModel> items,
    required double totalPrice,
    int? customerId,
  }) async {
    final pdf = pw.Document();

    // Load custom Arabic font
    final regularFont = pw.Font.ttf(await rootBundle.load(VFonts.sansRegular));
    final boldFont = pw.Font.ttf(await rootBundle.load(VFonts.sansBold));

    // Fetch item details for all items
    final itemDetailsList = await Future.wait(
      items.map((item) async {
        return await ref.read(itemByIdProvider(item.itemId).future);
      }),
    );

    // Fetch customer details if customerId is provided
    String customerName = "Unknown Customer"; // Default value
    if (customerId != null) {
      final customerAsync =
          await ref.read(customerByIdProvider(customerId).future);
      customerName = customerAsync?.name ?? "Unknown Customer";
    }

    pdf.addPage(
      pw.Page(
        theme: pw.ThemeData.withFont(
          base: regularFont,
          bold: boldFont,
        ),
        build: (pw.Context context) => pw.Directionality(
          textDirection: pw.TextDirection.rtl, // Important for Arabic
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              // Title
              pw.Text('فاتورة البيع',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  )),

              pw.SizedBox(height: 5),

              // Customer Name
              pw.Text('العميل: $customerName'),

              // Date Info
              pw.Text(
                  'التاريخ: ${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now())}'),
              pw.SizedBox(height: 10),

              pw.Divider(),

              // Items List
              ...List.generate(items.length, (index) {
                final item = items[index];
                final itemDetails = itemDetailsList[index];

                return pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                        '${itemDetails.name} × ${item.quantity}'), // Use item name here
                    pw.Text(
                      '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                    ),
                  ],
                );
              }),

              pw.Divider(),

              // Total Price
              pw.Text(
                'الإجمالي: \$${totalPrice.toStringAsFixed(2)}',
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),

              pw.SizedBox(height: 10),
              pw.Divider(),
              pw.Text('شكراً لتسوقكم معنا', textAlign: pw.TextAlign.center),
            ],
          ),
        ),
      ),
    );

    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
  }
}
