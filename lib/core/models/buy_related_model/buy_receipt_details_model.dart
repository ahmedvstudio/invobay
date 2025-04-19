import '../../database/drift/app_database.dart';

class BuyReceiptDetail {
  final BuyReceiptsModel receipt;
  final List<BuyReceiptItemsModel> items;
  final BuyPaymentsModel payment;

  BuyReceiptDetail(
      {required this.receipt, required this.items, required this.payment});
}
