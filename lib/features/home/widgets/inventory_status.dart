import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/constants/sizes.dart';

import '../../../common/styles/spacing_style.dart';
import '../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../core/providers/item_providers/item_related_providers.dart';
import '../../../core/router/router_constant.dart';

class VInventoryStatus extends ConsumerWidget {
  const VInventoryStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemNotifierProvider);
    final threshold = ref.watch(lowStockThresholdProvider);
    final outOfStockItems = items.where((item) => item.quantity == 0).toList();
    final lowStockItems = items
        .where((item) => item.quantity > 0 && item.quantity <= threshold)
        .toList();

    return InkWell(
      onTap: () => context.pushNamed(VRouter.lowStockScreen),
      child: Padding(
        padding: VSpacingStyle.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Stock Status',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .apply(color: VColors.white)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                            lowStockItems.isEmpty
                                ? Icons.check_circle
                                : Icons.arrow_drop_down_circle,
                            color: lowStockItems.isEmpty
                                ? VColors.success
                                : VColors.warning,
                            size: VSizes.iconSm),
                        const SizedBox(width: VSizes.xs),
                        Text(
                          lowStockItems.isEmpty
                              ? 'No Low Stock'
                              : 'Low Stock: ${lowStockItems.length}',
                          style: Theme.of(context).textTheme.labelLarge!.apply(
                              color: lowStockItems.isEmpty
                                  ? VColors.success
                                  : VColors.warning),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                            outOfStockItems.isEmpty
                                ? Icons.check_circle
                                : Iconsax.close_circle5,
                            color: outOfStockItems.isEmpty
                                ? VColors.success
                                : VColors.error,
                            size: VSizes.iconSm),
                        const SizedBox(width: VSizes.xs),
                        Text(
                          outOfStockItems.isEmpty
                              ? 'No Out of Stock'
                              : 'Out of Stock: ${outOfStockItems.length}',
                          style: Theme.of(context).textTheme.labelLarge!.apply(
                              color: outOfStockItems.isEmpty
                                  ? VColors.success
                                  : VColors.error),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
