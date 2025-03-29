import 'package:flutter/material.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import '../../../core/database/app_database.dart';

class VSellItem extends StatelessWidget {
  final Item item;

  const VSellItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: VColors.kPrimary.withValues(alpha: 0.8),
          radius: VSizes.iconSm,
          child: Text(
            item.name[0],
            style: const TextStyle().copyWith(color: VColors.white),
          ),
        ),
        const SizedBox(width: VSizes.spaceBtwItems),
        Flexible(
            child: Text(
          item.name,
          style: Theme.of(context).textTheme.titleSmall,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        )),
      ],
    );
  }
}
