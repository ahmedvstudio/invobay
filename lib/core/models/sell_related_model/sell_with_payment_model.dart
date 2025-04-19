class SellReceiptsWithPaymentModel {
  final int id;
  final DateTime date;
  final String paymentMethod;
  final double totalPrice;
  final double paidAmount;
  final double debtAmount;
  final String paymentStatus;

  SellReceiptsWithPaymentModel({
    required this.id,
    required this.date,
    required this.paymentMethod,
    required this.totalPrice,
    required this.paidAmount,
    required this.debtAmount,
    required this.paymentStatus,
  });
}
