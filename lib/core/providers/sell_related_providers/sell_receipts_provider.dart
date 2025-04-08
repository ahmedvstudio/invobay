import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/database/app_database.dart';

import '../../repository/sell_receipt_dao.dart';
import '../db_notifiers/app_providers.dart';

final sellReceiptsProvider = StreamProvider<List<SellReceiptsModel>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.select(db.sellReceipts).watch();
});

class ReceiptNotifier extends StateNotifier<List<SellReceiptsModel>> {
  final SellReceiptDao receiptDao;

  ReceiptNotifier(this.receiptDao) : super([]);

  Future<void> deleteReceipt(int id) async {
    await receiptDao.deleteReceipt(id);
    state = state.where((receipt) => receipt.id != id).toList();
  }
}
