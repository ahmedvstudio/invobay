import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/constants/sizes.dart';

import '../../../core/utils/constants/colors.dart';

class VaultButtons extends StatelessWidget {
  const VaultButtons({
    super.key,
    required this.isOut,
    required this.onPressed,
  });
  final bool isOut;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: onPressed,
        label: isOut ? const Text('Add Expense') : const Text('Add To Vault'),
        icon: isOut ? const Icon(Iconsax.minus) : const Icon(Iconsax.add),
        style: ElevatedButton.styleFrom(
          elevation: 2,
          foregroundColor: VColors.white,
          backgroundColor: isOut ? VColors.error : VColors.success,
          iconColor: VColors.white,
          disabledForegroundColor: VColors.darkGrey,
          disabledBackgroundColor: VColors.grey,
          side: const BorderSide(color: Colors.transparent),
          padding: const EdgeInsets.all(15),
          textStyle: const TextStyle(
              fontSize: 15,
              color: VColors.white,
              fontWeight: FontWeight.normal),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(VSizes.borderRadiusMd)),
        ),
      ),
    );
  }
}
