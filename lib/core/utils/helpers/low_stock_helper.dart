import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/numbers.dart';

class LowStockHelper {
  final int quantity;

  LowStockHelper(this.quantity);

  // Colors
  Color getThreeColor() {
    if (quantity != VNumbers.outOfStockNumber) {
      if (quantity > VNumbers.lowStockNumber) {
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
    if (quantity != VNumbers.outOfStockNumber) {
      if (quantity > VNumbers.lowStockNumber) {
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
