import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/features/sell_buy_return/buy/widgets/buy_item_list.dart';
import 'package:invobay/features/sell_buy_return/buy/widgets/supplier_and_clear.dart';

import '../../../common/widgets/appbar/main_appbar.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../common/widgets/sheet/items_bottom_sheet.dart';
import '../../../core/providers/buy_providers/buy_related_providers.dart';
import '../../../core/providers/item_providers/item_related_providers.dart';

import '../../../core/providers/sell_providers/update_subtotal_provider.dart';
import '../../../core/router/router_constant.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';

class BuyScreen extends ConsumerWidget {
  BuyScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buyItems = ref.watch(buyNotifierProvider);

    return Scaffold(
      body: Column(
        children: [
          VPrimaryHeaderContainer(
            child: Column(
              children: [
                const VMainAppBar(
                  title: 'Buy',
                  appbarIcon: Iconsax.shopping_cart5,
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
                VSearchContainer(
                  text: 'Search and Add Items',
                  onTap: () => showItemsBottomSheet(
                    context: context,
                    ref: ref,
                    searchController: _searchController,
                    isSell: false,
                  ),
                  prefixOnTap: () async {
                    // Start the barcode scan
                    final result = await BarcodeScanner.scan();

                    if (result.rawContent.isNotEmpty) {
                      final scannedBarcode = result.rawContent;
                      final itemNotifier =
                          ref.read(itemNotifierProvider.notifier);

                      // Fetch item by barcode
                      final item =
                          await itemNotifier.fetchItemByBarcode(scannedBarcode);

                      if (item != null) {
                        ref.read(buyNotifierProvider.notifier).addItem(item);
                      } else {
                        VHelperFunctions.showToasty(
                          message: 'Item not found!',
                          backgroundColor: VColors.warning,
                          textColor: VColors.grey,
                        );
                      }
                    }
                  },
                ),
                VSupplierAndClear(
                  clearAllOnPressed: () =>
                      ref.read(buyNotifierProvider.notifier).clearCart(),
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
              ],
            ),
          ),
          const Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                  left: VSizes.defaultSpace, right: VSizes.defaultSpace),
              child: Column(
                children: [
                  Expanded(child: BuyItemList(isCheckout: false)),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            bottom: VSizes.defaultSpace,
            left: VSizes.defaultSpace,
            right: VSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            if (buyItems.isNotEmpty) {
              final totalPrice =
                  calculateBuyTotalPrice(ref, buyItems); // Update subtotal
              context.pushNamed(
                VRouter.buyCheckout,
                extra: {
                  'boughtItems': buyItems,
                  'totalPrice': totalPrice,
                },
              );
            } else {
              VHelperFunctions.showToasty(
                message: 'Your list is Empty!',
                backgroundColor: VColors.warning,
                textColor: VColors.white,
              );
            }
          },
          child: const Text('Proceed to checkout'),
        ),
      ),
    );
  }
}
