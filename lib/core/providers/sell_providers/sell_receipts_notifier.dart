import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/drift/app_database.dart';
import '../../repository/sell_receipt_dao.dart';
import '../item_providers/item_related_providers.dart';

class SellReceiptNotifier extends StateNotifier<List<SellReceiptsModel>> {
  final SellReceiptDao receiptDao;

  SellReceiptNotifier(this.receiptDao) : super([]);

  Future<void> deleteReceipt(int id, WidgetRef ref) async {
    final itemNotifier = ref.read(itemNotifierProvider.notifier);

    await receiptDao.deleteReceipt(id);
    state = state.where((receipt) => receipt.id != id).toList();

    await itemNotifier.fetchItems();
  }

  Future<void> updatePaymentDetails({
    required int receiptId,
    required double newPaidAmount,
    required double newDebtAmount,
    required String newPaymentStatus,
  }) async {
    await receiptDao.updatePaymentDetails(
      receiptId: receiptId,
      newPaidAmount: newPaidAmount,
      newDebtAmount: newDebtAmount,
      newPaymentStatus: newPaymentStatus,
    );
    // await receiptDao.refreshReceiptData(receiptId);
  }
}
