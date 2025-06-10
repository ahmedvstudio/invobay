import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import '../../common/widgets/appbar/custom_appbar.dart';
import '../../common/widgets/sheet/add_sheets/add_quantity_sheet.dart';
import '../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../core/providers/item_providers/item_related_providers.dart';
import '../../core/utils/formatters/formatters.dart';
import '../../core/utils/helpers/low_stock_helper.dart';
import '../inventory/item_details/widgets/meta_data_section.dart';

class LowStockScreen extends ConsumerWidget {
  const LowStockScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemNotifierProvider);
    final threshold = ref.watch(lowStockThresholdProvider);
    final lowStockItems =
        items.where((item) => item.quantity <= threshold).toList();

    return Scaffold(
      body: lowStockItems.isEmpty
          ? Column(
              children: [
                VCustomAppBar(text: context.loc.lowStockItems),
                Flexible(
                    child: Center(child: Text(context.loc.allItemsAreInStock))),
              ],
            )
          : Column(
              children: [
                VCustomAppBar(text: context.loc.lowStockItems),
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: VSpacingStyle.horizontal,
                    itemCount: lowStockItems.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final item = lowStockItems[index];
                      final lowStockColor =
                          LowStockHelper(item.quantity, ref).getTwoColor();
                      final lowStockText =
                          LowStockHelper(item.quantity, ref).getTwoText();

                      return ListTile(
                        tileColor: Colors.transparent,
                        onTap: () => context.pushNamed(
                          VRouter.itemDetail,
                          pathParameters: {'id': item.id.toString()},
                        ),
                        title: Text(item.name,
                            style: Theme.of(context).textTheme.titleSmall),
                        subtitle: Row(
                          children: [
                            Flexible(
                              child: VMetaDataSection(
                                tag: lowStockText,
                                icon: Iconsax.box,
                                tagBackgroundColor: lowStockColor,
                                tagTextColor: VColors.white,
                                showIcon: false,
                                child: Text(
                                  VFormatters.formatPrice(item.quantity),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_shopping_cart),
                              onPressed: () => showAddQuantityBottomSheet(
                                  context, ref,
                                  itemId: item.id),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
