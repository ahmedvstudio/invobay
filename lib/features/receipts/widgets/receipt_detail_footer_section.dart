import 'package:flutter/material.dart';

class VReceiptDetailFooterSection extends StatelessWidget {
  const VReceiptDetailFooterSection({
    super.key,
    required this.totalPrice,
    required this.paymentStatus,
  });

  final String totalPrice;
  final String paymentStatus;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Total: $totalPrice",
                style: Theme.of(context).textTheme.titleLarge),
            Text("Status: $paymentStatus",
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ],
    );
  }
}
