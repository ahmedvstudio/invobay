import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/drift/app_database.dart';
import '../../models/sell_related_model/sell_model.dart';
import '../../models/sell_related_model/sell_with_payment_model.dart';
import '../../repository/sell_receipt_dao.dart';
import 'sell_notifier.dart';
import '../db_providers/database_provider.dart';
import '../item_providers/item_related_providers.dart';
import 'sell_checkout_notifier.dart';
import 'sell_receipts_notifier.dart';

// Sell Notifier Provider
final sellNotifierProvider =
    StateNotifierProvider.autoDispose<SellNotifier, List<SellItem>>((ref) {
  final itemDao = ref.read(itemDaoProvider);
  return SellNotifier(ref, itemDao);
});

// Sell Receipt Dao Provider
final sellReceiptDaoProvider = Provider<SellReceiptDao>((ref) {
  final db = ref.watch(databaseProvider);
  return SellReceiptDao(db);
});

// Sell Receipts Provider
final sellReceiptsProvider =
    StreamProvider<List<SellReceiptsWithPaymentModel>>((ref) {
  final dao = ref.watch(sellReceiptDaoProvider);
  return dao.watchReceiptsWithPayments();
});

// Sell Receipt Notifier Provider
final sellReceiptNotifierProvider =
    StateNotifierProvider<SellReceiptNotifier, List<SellReceiptsModel>>((ref) {
  final dao = ref.watch(sellReceiptDaoProvider);
  return SellReceiptNotifier(dao);
});

// Sell Checkout Provider
final sellCheckoutProvider = Provider((ref) {
  final sellReceiptDao = ref.watch(sellReceiptDaoProvider);
  return SellCheckoutNotifier(sellReceiptDao);
});

// Sold Item With Cost Provider
final soldItemsWithCostProvider =
    StreamProvider<List<SellReceiptItemsModel>>((ref) {
  final dao = ref.watch(sellReceiptDaoProvider);
  return dao.watchSoldItemsWithCost();
});
