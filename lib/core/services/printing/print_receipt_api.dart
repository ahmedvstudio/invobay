import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/services/printing/widgets/invoice_footer.dart';
import 'package:invobay/core/services/printing/widgets/invoice_header.dart';
import 'package:invobay/core/services/printing/widgets/font_utils.dart';
import 'package:invobay/core/services/printing/widgets/invoice_items.dart';
import 'package:invobay/core/services/printing/widgets/invoice_title.dart';
import 'package:invobay/core/services/printing/widgets/invoice_total.dart';
import 'package:invobay/core/services/printing/widgets/watermark.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../database/app_database.dart';
import '../../providers/common_providers/default_providers.dart';
import '../../providers/customer_providers/customer_related_providers.dart';
import '../../providers/item_providers/item_related_providers.dart';

class PrintReceiptApi {
  static Future<void> printReceipt({
    required WidgetRef ref,
    required List<SellReceiptItemsModel> items,
    required SellReceiptsModel receipt,
    required SellPaymentsModel payment,
    int? customerId,
  }) async {
    final fonts = await loadFonts();

    final itemDetailsList = await Future.wait(
      items.map((item) async {
        return await ref.read(itemByIdProvider(item.itemId).future);
      }),
    );

    CustomerData? customerData;
    if (customerId != null) {
      final customerAsync =
          await ref.read(customerByIdProvider(customerId).future);
      customerData = customerAsync;
    }
    var myTheme = pw.ThemeData.withFont(
      base: fonts.regularFont,
      bold: fonts.boldFont,
      italic: fonts.italicFont,
      boldItalic: fonts.boldItalicFont,
    );

    final pdf = pw.Document(theme: myTheme);

    pdf.addPage(
      buildPdfPage(
        items: items,
        itemDetailsList: itemDetailsList,
        ref: ref,
        receipt: receipt,
        payment: payment,
        customerData: customerData,
      ),
    );

    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
  }

  static pw.MultiPage buildPdfPage({
    required List<SellReceiptItemsModel> items,
    required List<Item> itemDetailsList,
    required SellReceiptsModel receipt,
    required SellPaymentsModel payment,
    CustomerData? customerData,
    required WidgetRef ref,
  }) {
    final currencySign = ref.watch(currencySignProvider);

    return pw.MultiPage(
      textDirection: pw.TextDirection.rtl,
      build: (pw.Context context) => [
        pw.Stack(
          children: [
            buildWatermark('shop Name'),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                /// --> Header
                invoHeader(
                  shopName: 'shopName',
                  shopNumber: 'shopNumber',
                  customerData: customerData,
                  receipt: receipt,
                  payment: payment,
                ),

                /// --> Title
                invoTitle(),

                /// --> Items
                invoiceItems(items, itemDetailsList, currencySign),
                pw.SizedBox(height: 1 * PdfPageFormat.cm),

                /// --> Total
                invoTotalSection(
                  currencySign: currencySign,
                  receipt: receipt,
                  payment: payment,
                ),
              ],
            ),
          ],
        ),
      ],

      /// --> Footer
      footer: (context) =>
          invoFooter(shopAddress: 'ديالى- جلولاء- قرب الجامع الكبير'),
    );
  }
}
