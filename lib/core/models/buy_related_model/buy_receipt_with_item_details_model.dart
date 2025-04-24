import '../../database/drift/app_database.dart';

class BuyReceiptWithItemDetails {
  final BuyReceiptsModel receipt;
  final int receiptId;
  final int? supplierId;
  final DateTime receiptDate;
  final double itemPrice;
  final double quantity;

  BuyReceiptWithItemDetails({
    required this.receiptId,
    required this.supplierId,
    required this.receiptDate,
    required this.receipt,
    required this.itemPrice,
    required this.quantity,
  });
}
