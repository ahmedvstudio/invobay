import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/providers/return_providers/return_checkout_notifier.dart';
import 'package:invobay/core/providers/return_providers/return_notifier.dart';
import 'package:invobay/core/providers/return_providers/return_receipts_notifier.dart';

import '../../database/drift/app_database.dart';
import '../../models/return_related_model/return_model.dart';
import '../../models/return_related_model/return_with_payment_model.dart';
import '../../repository/return_receipt_dao.dart';
import '../db_providers/database_provider.dart';
import '../item_providers/item_related_providers.dart';

// Return Notifier Provider
final returnNotifierProvider =
    StateNotifierProvider<ReturnNotifier, List<ReturnItem>>((ref) {
  final itemDao = ref.read(itemDaoProvider);
  return ReturnNotifier(ref, itemDao);
});

// Return Receipt Dao Provider
final returnReceiptDaoProvider = Provider<ReturnReceiptDao>((ref) {
  final db = ref.watch(databaseProvider);
  return ReturnReceiptDao(db);
});

// Return Receipts Provider
final returnReceiptsProvider =
    StreamProvider<List<ReturnReceiptsWithPaymentModel>>((ref) {
  final dao = ref.watch(returnReceiptDaoProvider);
  return dao.watchReceiptsWithPayments();
});

// Return Receipt Notifier Provider
final returnReceiptNotifierProvider =
    StateNotifierProvider<ReturnReceiptsNotifier, List<ReturnReceiptsModel>>(
        (ref) {
  final dao = ref.watch(returnReceiptDaoProvider);
  return ReturnReceiptsNotifier(dao);
});

// Return Checkout Provider
final returnCheckoutProvider = Provider((ref) {
  final returnReceiptDao = ref.watch(returnReceiptDaoProvider);
  return ReturnCheckoutNotifier(returnReceiptDao);
});
