import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../core/providers/theme_providers/theme_related_providers.dart';
import '../../../core/utils/constants/sizes.dart';

class VItemPriceTextWithIcon extends ConsumerWidget {
  const VItemPriceTextWithIcon({
    super.key,
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });

  final String price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencySign = ref.watch(currencySignProvider);
    final primaryColor = ref.watch(primaryColorProvider);

    return Row(
      children: [
        Icon(Iconsax.tag, color: primaryColor, size: VSizes.iconSm),
        const SizedBox(width: VSizes.xs),
        Text(
          '$currencySign $price',
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: isLarge
              ? Theme.of(context).textTheme.titleLarge!.apply(
                  decoration: lineThrough ? TextDecoration.lineThrough : null)
              : Theme.of(context).textTheme.bodyLarge!.apply(
                  decoration: lineThrough ? TextDecoration.lineThrough : null),
        ),
      ],
    );
  }
}
