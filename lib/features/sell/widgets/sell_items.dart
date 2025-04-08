import 'package:flutter/material.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/constants/sizes.dart';

class VSellItem extends StatelessWidget {
  const VSellItem({super.key, required this.itemName});
  final String itemName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: VColors.kPrimary.withValues(alpha: 0.8),
          radius: VSizes.iconSm,
          child: Text(
            itemName[0],
            style: const TextStyle().copyWith(color: VColors.white),
          ),
        ),
        const SizedBox(width: VSizes.spaceBtwItems),
        Flexible(
            child: Text(
          itemName,
          style: Theme.of(context).textTheme.titleSmall,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        )),
      ],
    );
  }
}
