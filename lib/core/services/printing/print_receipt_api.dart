import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/services/printing/widgets/font_utils.dart';
import 'package:invobay/core/services/printing/widgets/pdf_widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';

import '../../database/app_database.dart';
import '../../providers/customer_providers/customer_related_providers.dart';
import '../../providers/item_providers/item_related_providers.dart';

class PrintReceiptApi {
  static Future<void> printReceipt({
    required WidgetRef ref,
    required List<SellReceiptItemsModel> items,
    required double totalPrice,
    int? customerId,
  }) async {
    final fonts = await loadFonts();

    final itemDetailsList = await Future.wait(
      items.map((item) async {
        return await ref.read(itemByIdProvider(item.itemId).future);
      }),
    );

    String customerName = "Customer";
    if (customerId != null) {
      final customerAsync =
          await ref.read(customerByIdProvider(customerId).future);
      customerName = customerAsync?.name ?? "Customer";
    }

    final pdf = pw.Document(
      theme: pw.ThemeData.withFont(
        base: fonts.regularFont,
        bold: fonts.boldFont,
      ),
    );

    pdf.addPage(
      buildPdfPage(items, itemDetailsList, totalPrice),
    );

    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
  }

  static pw.MultiPage buildPdfPage(List<SellReceiptItemsModel> items,
      List<Item> itemDetailsList, double totalPrice) {
    return pw.MultiPage(
      textDirection: pw.TextDirection.rtl,
      build: (pw.Context context) => [
        buildHeader(),
        pw.SizedBox(height: 3 * PdfPageFormat.cm),
        buildTitle(),
        buildInvoice(items, itemDetailsList),
        pw.Divider(),
        buildTotal(totalPrice),
      ],
      footer: (context) => buildFooter(),
    );
  }
}
