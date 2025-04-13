import 'package:invobay/core/models/invoice_model/sell_invoice_info.dart';
import 'package:invobay/core/models/invoice_model/sell_invoice_item.dart';
import 'package:invobay/core/models/invoice_model/shop_model.dart';

import 'invoice_customer.dart';

class SellInvoice {
  final SellInvoiceInfo info;
  final Shop supplier;
  final Customer customer;
  final List<SellInvoiceItem> items;

  const SellInvoice({
    required this.info,
    required this.supplier,
    required this.customer,
    required this.items,
  });
}
