import '../../database/drift/app_database.dart';

class ReturnReceiptDetail {
  final ReturnReceiptsModel receipt;
  final List<ReturnReceiptItemsModel> items;
  final ReturnPaymentsModel payment;

  ReturnReceiptDetail(
      {required this.receipt, required this.items, required this.payment});
}
