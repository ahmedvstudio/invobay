import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/db_providers/hive_providers/app_settings_provider.dart';
import '../constants/colors.dart';
import '../constants/numbers.dart';

class LowStockHelper {
  final double quantity;
  final WidgetRef ref;
  LowStockHelper(this.quantity, this.ref);

  // Colors
  Color getThreeColor() {
    final threshold = ref.watch(lowStockThresholdProvider);
    if (quantity != VNumbers.outOfStockNumber) {
      if (quantity > threshold) {
        return VColors.success;
      } else {
        return VColors.warning;
      }
    } else {
      return VColors.error;
    }
  }

  Color getTwoColor() {
    if (quantity == VNumbers.outOfStockNumber) {
      return VColors.error;
    } else {
      return VColors.warning;
    }
  }

  // Text
  String getThreeText() {
    final threshold = ref.watch(lowStockThresholdProvider);
    if (quantity != VNumbers.outOfStockNumber) {
      if (quantity > threshold) {
        return 'In Stock';
      } else {
        return 'Low Stock';
      }
    } else {
      return 'Out of Stock';
    }
  }

  String getTwoText() {
    if (quantity == VNumbers.outOfStockNumber) {
      return 'Out of Stock';
    } else {
      return 'Low Stock';
    }
  }
}
