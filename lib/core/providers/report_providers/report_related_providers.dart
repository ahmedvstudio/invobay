import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/report_related_models/customer_spend_model.dart';
import '../../models/report_related_models/top_supplier_model.dart';
import '../../models/state_models/report_profit_state_model.dart';
import '../buy_providers/buy_related_providers.dart';
import '../item_providers/item_related_providers.dart';
import '../return_providers/return_related_providers.dart';
import '../sell_providers/sell_related_providers.dart';
import '../vault_providers/vault_related_providers.dart';

// Inventory Value Provider
final inventoryValueProvider = Provider<double>((ref) {
  final items = ref.watch(itemNotifierProvider);
  return items.fold(
      0.0, (sum, item) => sum + (item.quantity * item.buyingPrice));
});

// Total Sales Provider
final totalSaleProvider = Provider<double>((ref) {
  final receiptsAsync = ref.watch(sellReceiptsProvider);

  return receiptsAsync.when(
    data: (receipts) {
      return receipts.fold<double>(
        0.0,
        (sum, receipt) => sum + (receipt.paidAmount),
      );
    },
    loading: () => 0.0,
    error: (_, __) => 0.0,
  );
});

// Total Buy Provider
final totalBuyProvider = Provider<double>((ref) {
  final receiptsAsync = ref.watch(buyReceiptsProvider);

  return receiptsAsync.when(
    data: (receipts) {
      return receipts.fold<double>(
        0.0,
        (sum, receipt) => sum + (receipt.paidAmount),
      );
    },
    loading: () => 0.0,
    error: (_, __) => 0.0,
  );
});

// Total Return Provider
final totalReturnProvider = Provider<double>((ref) {
  final receiptsAsync = ref.watch(returnReceiptsProvider);

  return receiptsAsync.when(
    data: (receipts) {
      return receipts.fold<double>(
        0.0,
        (sum, receipt) => sum + (receipt.totalPrice),
      );
    },
    loading: () => 0.0,
    error: (_, __) => 0.0,
  );
});

//-----------------------------------------------------------------------
// Profit Stats Provider
final profitStatsProvider = Provider<ProfitStats>((ref) {
  final soldItemsAsync = ref.watch(soldItemsWithCostProvider);

  return soldItemsAsync.when(
    data: (soldItems) {
      double totalSales = 0.0;
      double totalCOGS = 0.0;

      for (final soldItem in soldItems) {
        totalSales += soldItem.quantity * soldItem.price;
        totalCOGS += soldItem.quantity * soldItem.costPrice;
      }

      final profit = totalSales - totalCOGS;
      return ProfitStats(
        totalSales: totalSales,
        totalCOGS: totalCOGS,
        profit: profit,
      );
    },
    loading: () => const ProfitStats.loading(),
    error: (_, __) => const ProfitStats.error(),
  );
});
//-------------------------------------------------------
final topCustomersProvider =
    StreamProvider.autoDispose<List<CustomerSpendModel>>((ref) {
  final dao = ref.watch(sellReceiptDaoProvider);
  return dao.watchTopCustomers();
});

final customerDebtsProvider =
    StreamProvider.autoDispose<List<CustomerDebtModel>>((ref) {
  final dao = ref.watch(sellReceiptDaoProvider);
  return dao.watchCustomerDebts();
});

final mostSoldItemsProvider =
    StreamProvider.autoDispose<List<MostSoldItemModel>>((ref) {
  final dao = ref.watch(sellReceiptDaoProvider);
  return dao.watchMostSoldItems();
});
//---------------------------
final topSuppliersProvider =
    StreamProvider.autoDispose<List<SupplierSpendModel>>((ref) {
  final dao = ref.watch(buyReceiptDaoProvider);
  return dao.watchTopSuppliers();
});

final supplierDebtsProvider =
    StreamProvider.autoDispose<List<SupplierDebtModel>>((ref) {
  final dao = ref.watch(buyReceiptDaoProvider);
  return dao.watchSupplierDebts();
});

final mostBoughtItemsProvider =
    StreamProvider.autoDispose<List<MostBoughtItemModel>>((ref) {
  final dao = ref.watch(buyReceiptDaoProvider);
  return dao.watchMostBoughtItems();
});

final averageItemCostProvider =
    StreamProvider.autoDispose<List<ItemAverageCostModel>>((ref) {
  final dao = ref.watch(buyReceiptDaoProvider);
  return dao.watchAverageCostPerItem();
});
//----------------------------------------
final mostReturnedItemsProvider = StreamProvider.autoDispose((ref) {
  final dao = ref.watch(returnReceiptDaoProvider);
  return dao.watchMostReturnedItems();
});
//------------------------------------------
final receiptsBalanceProvider = Provider<double>((ref) {
  final totalSales = ref.watch(totalSaleProvider);
  final totalBuy = ref.watch(totalBuyProvider);
  final totalReturn = ref.watch(totalReturnProvider);
  final currentBalance = ref.watch(currentBalanceProvider);

  return currentBalance + totalSales - totalBuy - totalReturn;
});

///------------------------------------
final currentBalanceProvider = Provider<double>((ref) {
  final vaultState = ref.watch(vaultDetailNotifierProvider(1));
  if (vaultState.isLoading) {
    return 0.0;
  } else if (vaultState.hasError) {
    return 0.0;
  }

  final vault = vaultState.value;
  final currentBalance = vault?.currentBalance ?? 0;
  return currentBalance;
});

///------------------------------------
final expenseBalanceProvider = Provider<double>((ref) {
  final vaultState = ref.watch(vaultDetailNotifierProvider(1));
  if (vaultState.isLoading) {
    return 0.0;
  } else if (vaultState.hasError) {
    return 0.0;
  }

  final vault = vaultState.value;
  final expenseBalance = vault?.totalReduced ?? 0;
  return expenseBalance;
});
