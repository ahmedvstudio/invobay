import 'package:flutter/material.dart';
import 'package:invobay/core/models/invoice_model/shop_model.dart';
import 'package:invobay/core/services/sell_invoice/sell_invoice_api.dart';

import '../../models/invoice_model/invoice_customer.dart';
import '../../models/invoice_model/sell_invoice_info.dart';
import '../../models/invoice_model/sell_invoice_item.dart';
import '../../models/invoice_model/sell_invoice_model.dart';
import '../../utils/pdf/pdf_api.dart';

class SellInvoicePrinter {
  static Future<void> printReceipt(BuildContext context) async {
    final date = DateTime.now();
    final dueDate = date.add(const Duration(days: 7));

    final invoice = SellInvoice(
      supplier: const Shop(
        name: 'Sarah Field',
        address: 'Sarah Street 9, Beijing, China',
        socialMedia: 'https://paypal.me/sarahfieldzz',
      ),
      customer: const Customer(
        name: 'Apple Inc.',
        address: 'Apple Street, Cupertino, CA 95014',
      ),
      info: SellInvoiceInfo(
        date: date,
        dueDate: dueDate,
        description: 'My description...',
        number: '${DateTime.now().year}-9999',
      ),
      items: [
        SellInvoiceItem(
          description: 'Coffee',
          date: DateTime.now(),
          quantity: 3,
          vat: 0.19,
          unitPrice: 5.99,
        ),
        SellInvoiceItem(
          description: 'Water',
          date: DateTime.now(),
          quantity: 8,
          vat: 0.19,
          unitPrice: 0.99,
        ),
        SellInvoiceItem(
          description: 'Orange',
          date: DateTime.now(),
          quantity: 3,
          vat: 0.19,
          unitPrice: 2.99,
        ),
        SellInvoiceItem(
          description: 'Apple',
          date: DateTime.now(),
          quantity: 8,
          vat: 0.19,
          unitPrice: 3.99,
        ),
        SellInvoiceItem(
          description: 'Mango',
          date: DateTime.now(),
          quantity: 1,
          vat: 0.19,
          unitPrice: 1.59,
        ),
        SellInvoiceItem(
          description: 'Blue Berries',
          date: DateTime.now(),
          quantity: 5,
          vat: 0.19,
          unitPrice: 0.99,
        ),
        SellInvoiceItem(
          description: 'Lemon',
          date: DateTime.now(),
          quantity: 4,
          vat: 0.19,
          unitPrice: 1.29,
        ),
      ],
    );

    final pdfFile = await SellInvoiceApi.generate(invoice);
    PdfApi.printFile(pdfFile);
    // PdfApi.openFile(pdfFile);
  }
}
