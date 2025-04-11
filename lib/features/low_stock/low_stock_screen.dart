import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../common/widgets/appbar/custom_appbar.dart';
import '../../common/widgets/dialogs/add_quantity_dialog.dart';
import '../../core/providers/item_providers/item_related_providers.dart';
import '../../core/utils/constants/numbers.dart';
import '../../core/utils/helpers/low_stock_helper.dart';
import '../item_details/widgets/meta_data_section.dart';

class LowStockScreen extends ConsumerWidget {
  const LowStockScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemNotifierProvider);
    final lowStockItems = items
        .where((item) => item.quantity <= VNumbers.lowStockNumber)
        .toList();

    return Scaffold(
      body: lowStockItems.isEmpty
          ? Column(
              children: [
                VCustomAppBar(
                  text: 'Low Stock Items',
                  showBackArrow: false,
                  actions: [
                    IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(
                          CupertinoIcons.xmark,
                          color: VColors.white,
                        ))
                  ],
                ),
                const Flexible(
                    child: Center(child: Text("All items are in stock!"))),
              ],
            )
          : Column(
              children: [
                VCustomAppBar(
                  text: 'Low Stock Items',
                  showBackArrow: false,
                  actions: [
                    IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(
                          CupertinoIcons.xmark,
                          color: VColors.white,
                        ))
                  ],
                ),
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(
                      left: VSizes.defaultSpace,
                      right: VSizes.defaultSpace,
                    ),
                    itemCount: lowStockItems.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final item = lowStockItems[index];
                      final lowStockColor =
                          LowStockHelper(item.quantity).getTwoColor();
                      final lowStockText =
                          LowStockHelper(item.quantity).getTwoText();

                      return ListTile(
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
                                  '${item.quantity}',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_shopping_cart),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      VAddQuantityDialog(itemId: item.id),
                                );
                              },
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
