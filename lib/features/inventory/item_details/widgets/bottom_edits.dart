import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../common/widgets/icons/circular_icon.dart';
import '../../../../common/widgets/icons/circular_icon_with_conformation.dart';
import '../../../../common/widgets/sheet/add_sheets/add_quantity_sheet.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

class VBottomEdits extends ConsumerWidget {
  final Function(BuildContext, int) onEdit;
  final Function(BuildContext, int) onDelete;
  final int itemId;

  const VBottomEdits({
    super.key,
    required this.onEdit,
    required this.onDelete,
    required this.itemId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: VSizes.defaultSpace, vertical: VSizes.defaultSpace),
      decoration: BoxDecoration(
        color: isDark ? VColors.darkerGrey : VColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(VSizes.cardRadiusLg),
          topRight: Radius.circular(VSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              VCircularIconWithConfirmation(
                onPressed: () => onDelete(context, itemId),
                icon: Iconsax.trash,
                backgroundColor: VColors.error,
                width: 40,
                height: 40,
                color: VColors.white,
              ),
              const SizedBox(width: VSizes.spaceBtwItems),
              VCircularIcon(
                onPressed: () =>
                    showAddQuantityBottomSheet(context, ref, itemId: itemId),
                icon: Iconsax.add,
                backgroundColor: VColors.black,
                width: 40,
                height: 40,
                color: VColors.white,
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () => onEdit(context, itemId),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(VSizes.md),
              backgroundColor: VColors.black,
              side: const BorderSide(color: VColors.black),
            ),
            label: Text(context.loc.edit),
            icon: const Icon(Iconsax.edit),
          )
        ],
      ),
    );
  }
}
