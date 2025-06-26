import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/services/printing/sell_receipt_print/widgets/font_utils.dart';
import 'package:invobay/core/services/printing/sell_receipt_print/widgets/invoice_footer.dart';
import 'package:invobay/core/services/printing/sell_receipt_print/widgets/invoice_header.dart';
import 'package:invobay/core/services/printing/sell_receipt_print/widgets/invoice_items.dart';
import 'package:invobay/core/services/printing/sell_receipt_print/widgets/invoice_title.dart';
import 'package:invobay/core/services/printing/sell_receipt_print/widgets/invoice_total.dart';
import 'package:invobay/core/services/printing/sell_receipt_print/widgets/watermark.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../database/drift/app_database.dart';
import '../../../database/hive/shop_details/shop_details.dart';
import '../../../providers/customer_providers/customer_related_providers.dart';
import '../../../providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../providers/item_providers/item_related_providers.dart';

class PrintReceiptApi {
  static Future<void> printReceipt({
    required BuildContext context,
    required WidgetRef ref,
    required List<SellReceiptItemsModel> items,
    required SellReceiptsModel receipt,
    required SellPaymentsModel payment,
    ShopDetail? shopDetail,
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
    if (!context.mounted) return;
    pdf.addPage(
      buildPdfPage(
        crx: context,
        items: items,
        itemDetailsList: itemDetailsList,
        ref: ref,
        receipt: receipt,
        payment: payment,
        customerData: customerData,
        shopDetail: shopDetail,
      ),
    );

    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
  }

  static pw.MultiPage buildPdfPage({
    required List<SellReceiptItemsModel> items,
    required List<Item?> itemDetailsList,
    required SellReceiptsModel receipt,
    required SellPaymentsModel payment,
    CustomerData? customerData,
    ShopDetail? shopDetail,
    required WidgetRef ref,
    required BuildContext crx,
  }) {
    final currencySign = ref.watch(currencySignProvider);

    return pw.MultiPage(
        textDirection: pw.TextDirection.rtl,
        build: (pw.Context context) => [
              pw.Stack(
                children: [
                  buildWatermark(shopDetail?.name ?? 'Your Shop'),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      /// --> Header
                      invoHeader(
                        customerData: customerData,
                        receipt: receipt,
                        payment: payment,
                        shopDetail: shopDetail,
                        context: crx,
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
        footer: (context) {
          final shopComponents = [
            shopDetail?.country,
            shopDetail?.state,
            shopDetail?.city,
            shopDetail?.street,
          ];
          final address = shopComponents
              .where((component) => component != null && component.isNotEmpty)
              .join(', ');
          return invoFooter(shopAddress: address);
        });
  }
}
