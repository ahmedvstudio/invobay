import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../db_providers/database_provider.dart';

final weeklySalesPurchasesProvider = FutureProvider.autoDispose
    .family<List<Map<String, dynamic>>, DateTimeRange>(
  (ref, dateRange) async {
    final db = ref.watch(databaseProvider);
    // Fetch sell receipts in range
    final sellReceipts = await (db.select(db.sellReceipts)
          ..where((r) => r.date.isBiggerOrEqualValue(dateRange.start))
          ..where((r) => r.date.isSmallerOrEqualValue(dateRange.end)))
        .get();

    // Fetch buy receipts in range
    final buyReceipts = await (db.select(db.buyReceipts)
          ..where((r) => r.date.isBiggerOrEqualValue(dateRange.start))
          ..where((r) => r.date.isSmallerOrEqualValue(dateRange.end)))
        .get();

    // Group by day and sum totals
    Map<String, double> salesPerDay = {};
    Map<String, double> buysPerDay = {};

    for (var receipt in sellReceipts) {
      final day =
          receipt.date.toIso8601String().substring(0, 10); // 'YYYY-MM-DD'
      salesPerDay[day] = (salesPerDay[day] ?? 0) +
          receipt.totalPrice; // adjust field as needed
    }
    for (var receipt in buyReceipts) {
      final day = receipt.date.toIso8601String().substring(0, 10);
      buysPerDay[day] = (buysPerDay[day] ?? 0) + receipt.totalPrice;
    }

    // Build list of days in order
    List<String> weekDays = [];
    DateTime d = dateRange.start;
    while (!d.isAfter(dateRange.end)) {
      weekDays.add(d.toIso8601String().substring(0, 10));
      d = d.add(const Duration(days: 1));
    }

    // Prepare data for chart
    List<Map<String, dynamic>> result = [];
    for (final day in weekDays) {
      result.add({
        "date": day,
        "sales": salesPerDay[day] ?? 0,
        "buys": buysPerDay[day] ?? 0,
      });
    }
    return result;
  },
);
//------------------------------------------
final salesByPaymentMethodProvider =
    FutureProvider.family<Map<String, Map<String, dynamic>>, DateTimeRange>(
  (ref, dateRange) async {
    final db = ref.watch(databaseProvider);

    final sellReceipts = await (db.select(db.sellReceipts)
          ..where((r) => r.date.isBiggerOrEqualValue(dateRange.start))
          ..where((r) => r.date.isSmallerOrEqualValue(dateRange.end)))
        .get();

    final Map<String, Map<String, dynamic>> data = {};

    for (final receipt in sellReceipts) {
      final payment = await (db.select(db.sellPayments)
            ..where((p) => p.receiptId.equals(receipt.id)))
          .getSingleOrNull();

      if (payment == null) continue;

      final method = payment.paymentMethod;

      if (!data.containsKey(method)) {
        data[method] = {'total': 0.0, 'count': 0};
      }
      data[method]!['total'] =
          (data[method]!['total'] as double) + receipt.totalPrice;
      data[method]!['count'] = (data[method]!['count'] as int) + 1;
    }

    return data;
  },
);

//------------------------------------------
final taxCollectedProvider = FutureProvider.family<double, DateTimeRange>(
  (ref, dateRange) async {
    final db = ref.watch(databaseProvider);

    final sellReceipts = await (db.select(db.sellReceipts)
          ..where((r) => r.date.isBiggerOrEqualValue(dateRange.start))
          ..where((r) => r.date.isSmallerOrEqualValue(dateRange.end)))
        .get();

    double totalTax = 0;
    for (final receipt in sellReceipts) {
      totalTax += receipt.taxFee;
    }

    return totalTax;
  },
);
