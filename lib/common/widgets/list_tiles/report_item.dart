import 'package:flutter/material.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/constants/sizes.dart';

class VReportItem extends StatelessWidget {
  const VReportItem({
    super.key,
    required this.itemNumber,
    required this.itemName,
    required this.subtitle,
    required this.trailing,
    this.trailingColor,
  });
  final String itemNumber;
  final String itemName;
  final String subtitle;
  final String trailing;
  final Color? trailingColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: VColors.primary.withValues(alpha: 0.8),
          radius: VSizes.iconSm,
          child: Text(
            itemNumber,
            style: const TextStyle().copyWith(color: VColors.white),
          ),
        ),
        Flexible(
            child: ListTile(
          title: Text(
            itemName,
            style: Theme.of(context).textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          subtitle:
              Text(subtitle, style: Theme.of(context).textTheme.labelLarge),
          trailing: Text(
            trailing,
            style: const TextStyle()
                .copyWith(color: trailingColor, fontWeight: FontWeight.bold),
          ),
        )),
      ],
    );
  }
}
