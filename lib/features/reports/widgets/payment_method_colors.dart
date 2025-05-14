import 'package:flutter/material.dart';
import 'package:invobay/core/utils/constants/sizes.dart';

class PaymentMethodColors extends StatelessWidget {
  const PaymentMethodColors({
    super.key,
    required this.color,
    required this.title,
  });
  final Color color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          color: color,
        ),
        const SizedBox(width: VSizes.spaceBtwItems / 2),
        Text(title),
      ],
    );
  }
}
