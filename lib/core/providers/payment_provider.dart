import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/utils/constants/image_strings.dart';

class PaymentMethod {
  final String name;
  final String imagePath;

  PaymentMethod({required this.name, required this.imagePath});
}

// List of payment methods
final paymentMethodsProvider = Provider<List<PaymentMethod>>((ref) => [
      PaymentMethod(name: "Cash", imagePath: VImages.cashSVG),
      PaymentMethod(name: "Debt", imagePath: VImages.debtSVG),
      PaymentMethod(name: "MasterCard", imagePath: VImages.masterCashSVG),
    ]);

// StateNotifier to manage selected payment method
class SelectedPaymentNotifier extends StateNotifier<PaymentMethod> {
  SelectedPaymentNotifier(List<PaymentMethod> paymentMethods)
      : super(paymentMethods.first); // Default to first method

  void selectPayment(PaymentMethod method) {
    state = method;
  }
}

// Provider to hold the selected payment method
final selectedPaymentProvider =
    StateNotifierProvider<SelectedPaymentNotifier, PaymentMethod>((ref) {
  final paymentMethods = ref.watch(paymentMethodsProvider);
  return SelectedPaymentNotifier(paymentMethods);
});
