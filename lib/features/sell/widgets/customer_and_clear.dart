import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'customer_name_dialog.dart';
import '../../../core/providers/default_providers.dart';
import '../../../core/utils/constants/colors.dart';

class VCustomerAndClear extends StatelessWidget {
  const VCustomerAndClear({
    super.key,
    required this.clearAllOnPressed,
  });

  final VoidCallback clearAllOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Consumer(
          builder: (context, ref, _) {
            final customerName = ref.watch(customerNameProvider);
            return TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const VCustomerNameDialog(),
                );
              },
              child: Text(
                'Customer:\n$customerName',
                style: const TextStyle(color: VColors.white),
              ),
            );
          },
        ),
        TextButton(
          onPressed: clearAllOnPressed,
          child: const Text(
            'Clear all',
            style: TextStyle(color: VColors.white),
          ),
        ),
      ],
    );
  }
}
