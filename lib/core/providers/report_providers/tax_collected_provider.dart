import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/constants/enums.dart';
import '../db_providers/database_provider.dart';

final taxCollectedProvider = FutureProvider.family<double, DateTimeRange>(
  (ref, dateRange) async {
    final db = ref.watch(databaseProvider);

    final sellReceipts = await (db.select(db.sellReceipts)
          ..where((r) => r.date.isBiggerOrEqualValue(dateRange.start))
          ..where((r) => r.date.isSmallerOrEqualValue(dateRange.end)))
        .get();

    double totalTax = 0;
    for (final receipt in sellReceipts) {
      double discountAmount = 0;
      if (receipt.discountType == DiscountType.percentage.name) {
        discountAmount = receipt.subTotalPrice * (receipt.discount / 100);
      } else if (receipt.discountType == DiscountType.amount.name) {
        discountAmount = receipt.discount;
      }
      final discountedSubtotal = receipt.subTotalPrice - discountAmount;

      final taxedAmount = discountedSubtotal * (receipt.taxFee / 100);

      totalTax += taxedAmount;
    }

    return totalTax;
  },
);
