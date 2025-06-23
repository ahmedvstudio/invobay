import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/theme_providers/theme_related_providers.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

class VItemTitleTextWithIcon extends StatelessWidget {
  const VItemTitleTextWithIcon({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 1,
    this.textAlign,
    this.icon,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer(
          builder: (context, ref, _) {
            final primaryColor = ref.watch(primaryColorProvider);
            return CircleAvatar(
              radius: VSizes.iconSm,
              backgroundColor: primaryColor,
              child: icon == null
                  ? Text(
                      title[0],
                      style: const TextStyle(color: VColors.white),
                    )
                  : Icon(icon, color: VColors.white),
            );
          },
        ),
        const SizedBox(width: VSizes.sm),
        Flexible(
          child: Text(
            title,
            style: smallSize
                ? Theme.of(context).textTheme.bodyMedium
                : Theme.of(context).textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLines,
            textAlign: textAlign,
          ),
        ),
      ],
    );
  }
}
