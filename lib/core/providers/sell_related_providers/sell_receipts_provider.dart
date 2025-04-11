import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/providers/sell_related_providers/sell_checkout_provider.dart';

import '../../database/app_database.dart';
import '../../repository/sell_receipt_dao.dart';
import '../db_notifiers/app_providers.dart';
import '../../models/sell_with_payment_model.dart';

final receiptNotifierProvider =
    StateNotifierProvider<SellReceiptNotifier, List<SellReceiptsModel>>((ref) {
  final dao = ref.watch(sellReceiptDaoProvider);
  return SellReceiptNotifier(dao);
});

final sellReceiptDaoProvider = Provider<SellReceiptDao>((ref) {
  final db = ref.watch(databaseProvider);
  return SellReceiptDao(db);
});

final sellCheckoutProvider = Provider((ref) {
  final sellReceiptDao = ref.watch(sellReceiptDaoProvider);
  return SellCheckoutNotifier(sellReceiptDao);
});
final sellReceiptsProvider =
    StreamProvider<List<SellReceiptsWithPaymentModel>>((ref) {
  final dao = ref.watch(sellReceiptDaoProvider);
  return dao.watchReceiptsWithPayments();
});

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
