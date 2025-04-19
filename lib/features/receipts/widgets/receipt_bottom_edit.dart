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
    this.statusIconColor,
    this.printReceipt,
    required this.withPrint,
  });
  final VoidCallback changePayment;
  final VoidCallback deleteReceipt;
  final VoidCallback? printReceipt;
  final bool withPrint;
  final Color? statusIconColor;
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
          const SizedBox(width: VSizes.spaceBtwItems),
          if (withPrint) ...[
            VCircularIcon(
              icon: Iconsax.printer,
              backgroundColor: VColors.info,
              color: VColors.white,
              onPressed: printReceipt,
            ),
            const SizedBox(width: VSizes.spaceBtwSections),
          ],
          Flexible(
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: changePayment,
                label: const Text('New Payment'),
                icon: Icon(Iconsax.status_up, color: statusIconColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
