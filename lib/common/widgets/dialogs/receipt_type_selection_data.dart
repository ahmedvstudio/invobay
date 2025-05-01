import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/router/router_constant.dart';

import '../../../core/utils/constants/sizes.dart';

class VReceiptTypeSelectionDialog extends StatelessWidget {
  const VReceiptTypeSelectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Receipt Type'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: VSizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Iconsax.tag5),
              label: const Text('Sell Receipts'),
              onPressed: () {
                context.pop();
                context.pushNamed(VRouter.sellReceipts);
              },
            ),
          ),
          const SizedBox(height: VSizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Iconsax.shopping_cart5),
              label: const Text('Buy Receipts'),
              onPressed: () {
                context.pop();
                context.pushNamed(VRouter.buyReceipts);
              },
            ),
          ),
          const SizedBox(height: VSizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Iconsax.shopping_bag5),
              label: const Text('Return Receipts'),
              onPressed: () {
                context.pop();
                context.pushNamed(VRouter.returnReceipts);
              },
            ),
          ),
        ],
      ),
    );
  }
}
