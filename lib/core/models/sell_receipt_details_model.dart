import '../database/drift/app_database.dart';

class SellReceiptDetail {
  final SellReceiptsModel receipt;
  final List<SellReceiptItemsModel> items;
  final SellPaymentsModel payment;

  SellReceiptDetail(
      {required this.receipt, required this.items, required this.payment});
}
