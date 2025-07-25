class ReturnReceiptsWithPaymentModel {
  final int id;
  final DateTime date;
  final String paymentMethod;
  final double totalPrice;
  final double paidAmount;
  final double debtAmount;
  final String paymentStatus;

  ReturnReceiptsWithPaymentModel({
    required this.id,
    required this.date,
    required this.paymentMethod,
    required this.totalPrice,
    required this.paidAmount,
    required this.debtAmount,
    required this.paymentStatus,
  });
}
