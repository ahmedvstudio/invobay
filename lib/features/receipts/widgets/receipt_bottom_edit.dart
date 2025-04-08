import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/icons/circular_icon.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

class VReceiptBottomEdit extends StatelessWidget {
  const VReceiptBottomEdit({
    super.key,
    required this.addItem,
    required this.deleteReceipt,
  });
  final VoidCallback addItem;
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
          ElevatedButton(onPressed: addItem, child: const Text('Add Item')),
        ],
      ),
    );
  }
}
