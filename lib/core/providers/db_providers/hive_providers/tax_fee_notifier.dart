import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaxFeeNotifier extends StateNotifier<double> {
  TaxFeeNotifier(super.state);

  void update(double newTax) {
    state = newTax;
  }

  void resetToDefault(double defaultTax) {
    state = defaultTax;
  }
}
