import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/icons/circular_icon.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

class VReceiptBottomEdit extends StatelessWidget {
  const VReceiptBottomEdit({
    super.key,
    required this.changePayment,
    required this.deleteReceipt,
  });
  final VoidCallback changePayment;
  final VoidCallback deleteReceipt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: VSizes.defaultSpace, vertical: VSizes.defaultSpace / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VCircularIcon(
            icon: Iconsax.trash,
            backgroundColor: VColors.error,
            color: VColors.white,
            onPressed: deleteReceipt,
          ),
          OutlinedButton(
              onPressed: changePayment, child: const Text('Payment Status')),
        ],
      ),
    );
  }
}
