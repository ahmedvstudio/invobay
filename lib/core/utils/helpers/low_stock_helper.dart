import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../providers/localization_related_providers/localization_provider.dart';
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
    final loc = ref.watch(localizationProvider);
    if (quantity != VNumbers.outOfStockNumber) {
      if (quantity > threshold) {
        return loc.inStock;
      } else {
        return loc.lowStock;
      }
    } else {
      return loc.outOfStock2;
    }
  }

  String getTwoText() {
    final loc = ref.watch(localizationProvider);
    if (quantity == VNumbers.outOfStockNumber) {
      return loc.outOfStock2;
    } else {
      return loc.lowStock;
    }
  }
}
