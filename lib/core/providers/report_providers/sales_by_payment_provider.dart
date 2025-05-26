import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../db_providers/database_provider.dart';

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
