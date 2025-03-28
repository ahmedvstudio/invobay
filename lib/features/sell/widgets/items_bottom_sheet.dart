import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/widgets/item_cards/item_card_horizontal.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/device/device_utility.dart';

import '../../../common/widgets/text_field/search_bar.dart';
import '../../../core/database/app_database.dart';
import '../../../core/providers/db_notifiers/app_providers.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/low_stock_helper.dart';

// Provider to manage filtered items
final filteredItemsProvider = StateProvider<List<Item>>((ref) => []);

void showItemsBottomSheet(BuildContext context, WidgetRef ref,
    TextEditingController searchController) {
  final itemNotifier = ref.read(itemNotifierProvider.notifier);

  // Fetch items only if they are not loaded
  if (ref.watch(itemNotifierProvider).isEmpty) {
    itemNotifier.fetchItems();
  }

  final inventoryItems = ref.watch(itemNotifierProvider);
  final filteredItemsNotifier = ref.read(filteredItemsProvider.notifier);

  // Initialize filtered items only once
  if (ref.watch(filteredItemsProvider).isEmpty && inventoryItems.isNotEmpty) {
    filteredItemsNotifier.state = List.from(inventoryItems);
  }

  // Function to filter items based on search query
  void filterItems(String query) {
    final updatedList = query.isEmpty
        ? inventoryItems
        : inventoryItems
            .where(
                (item) => item.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    filteredItemsNotifier.state = updatedList;
  }

  searchController.clear();
  filterItems('');

  showModalBottomSheet(
    barrierColor: VColors.black.withValues(alpha: 0.8),
    context: context,
    elevation: 10,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Consumer(builder: (context, ref, child) {
        final filteredItems = ref.watch(filteredItemsProvider);

        return SizedBox(
          height: VDeviceUtils.getScreenHeight(context) * 0.6,
          child: Padding(
            padding: const EdgeInsets.only(bottom: VSizes.spaceBtwItems),
            child: Column(
              children: [
                VSearchBar(
                  searchController: searchController,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      searchController.clear();
                      filterItems('');
                    },
                  ),
                  onChanged: filterItems,
                ),
                const SizedBox(height: VSizes.spaceBtwSections),
                filteredItems.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.all(VSizes.defaultSpace),
                        child: Text("No items found"),
                      )
                    : Flexible(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: VSizes.spaceBtwItems),
                          shrinkWrap: true,
                          itemCount: filteredItems.length,
                          itemBuilder: (context, index) {
                            final item = filteredItems[index];
                            final lowStockColor =
                                LowStockHelper(item.quantity).getThreeColor();

                            return VItemCardHorizontal(
                              onTapItemDetails: () {
                                ref
                                    .read(sellNotifierProvider.notifier)
                                    .addItem(item);
                                context.pop();
                              },
                              itemName: item.name,
                              itemStock: item.quantity.toString(),
                              itemPrice: item.sellingPrice.toString(),
                              stockIconColor: lowStockColor,
                            );
                          },
                          separatorBuilder: (_, index) =>
                              const SizedBox(height: VSizes.spaceBtwItems / 2),
                        ),
                      ),
              ],
            ),
          ),
        );
      });
    },
  );
}
