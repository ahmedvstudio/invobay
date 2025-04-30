import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/drift/app_database.dart';
import '../../models/buy_related_model/buy_model.dart';
import '../../models/buy_related_model/buy_with_payment_model.dart';
import '../../repository/buy_receipt_dao.dart';
import '../db_providers/database_provider.dart';
import '../item_providers/item_related_providers.dart';
import 'buy_checkout_notifier.dart';
import 'buy_notifier.dart';
import 'buy_receipt_notifier.dart';

final buyNotifierProvider =
    StateNotifierProvider.autoDispose<BuyNotifier, List<BuyItem>>((ref) {
  final itemDao = ref.read(itemDaoProvider);
  return BuyNotifier(ref, itemDao);
});

// Buy Receipt Dao Provider
final buyReceiptDaoProvider = Provider<BuyReceiptDao>((ref) {
  final db = ref.watch(databaseProvider);
  return BuyReceiptDao(db);
});

// Buy Receipts Provider
final buyReceiptsProvider =
    StreamProvider<List<BuyReceiptsWithPaymentModel>>((ref) {
  final dao = ref.watch(buyReceiptDaoProvider);
  return dao.watchReceiptsWithPayments();
});

// Buy Receipt Notifier Provider
final buyReceiptNotifierProvider =
    StateNotifierProvider<BuyReceiptNotifier, List<BuyReceiptsModel>>((ref) {
  final dao = ref.watch(buyReceiptDaoProvider);
  return BuyReceiptNotifier(dao);
});

// Buy Checkout Provider
final buyCheckoutProvider = Provider((ref) {
  final buyReceiptDao = ref.watch(buyReceiptDaoProvider);
  return BuyCheckoutNotifier(buyReceiptDao);
});
