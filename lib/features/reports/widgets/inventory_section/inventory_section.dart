import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../common/widgets/list_tiles/report_list_tile.dart';
import 'widgets/stock_preview_sheet.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../core/database/drift/app_database.dart';
import '../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../core/providers/item_providers/item_related_providers.dart';
import '../../../../core/utils/constants/sizes.dart';

class VInventorySection extends ConsumerWidget {
  const VInventorySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allItems = ref.watch(itemNotifierProvider);
    final threshold = ref.watch(lowStockThresholdProvider);

    final lowStockItems = allItems
        .where((item) => item.quantity > 0 && item.quantity <= threshold)
        .take(5)
        .toList();
    final outOfStockItems =
        allItems.where((item) => item.quantity == 0).take(5).toList();
    final newStockItems = List<Item>.from(allItems)
      ..sort((a, b) => b.id.compareTo(a.id));
    final recentItems = newStockItems.take(5).toList();

    return Column(
      children: [
        VSectionHeading(title: context.loc.inventory, showActionButton: false),
        const SizedBox(height: VSizes.spaceBtwItems),
        VReportListTile(
          title: context.loc.newStockItems,
          icon: Icons.new_releases_outlined,
          onTap: () => showStockPreviewBottomSheet(context,
              title: context.loc.newStockItems, items: recentItems),
        ),
        VReportListTile(
          title: context.loc.lowStockItems,
          icon: Icons.low_priority,
          onTap: () => showStockPreviewBottomSheet(context,
              title: context.loc.lowStockItems, items: lowStockItems),
        ),
        VReportListTile(
          title: context.loc.outOfStockItems,
          icon: Icons.outbond_outlined,
          onTap: () => showStockPreviewBottomSheet(context,
              title: context.loc.outOfStockItems, items: outOfStockItems),
        ),
      ],
    );
  }
}
