class SellInvoiceInfo {
  final String description;
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const SellInvoiceInfo({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,
  });
}
