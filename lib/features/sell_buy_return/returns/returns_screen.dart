import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/providers/return_providers/return_related_providers.dart';
import 'package:invobay/features/sell_buy_return/returns/widgets/returned_item_list.dart';

import '../../../common/widgets/appbar/main_appbar.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../common/widgets/sheet/return_item_sheet.dart';
import '../../../core/providers/buy_providers/buy_related_providers.dart';
import '../../../core/providers/common_providers/update_subtotal_provider.dart';
import '../../../core/providers/item_providers/item_related_providers.dart';
import '../../../core/router/router_constant.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';

class ReturnsScreen extends ConsumerWidget {
  ReturnsScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final returnItems = ref.watch(returnNotifierProvider);

    return Scaffold(
      body: Column(
        children: [
          VPrimaryHeaderContainer(
            child: Column(
              children: [
                const VMainAppBar(
                  title: 'Return',
                  appbarIcon: Iconsax.shopping_bag,
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
                VSearchContainer(
                  text: 'Search and Add Items',
                  showPrefixIcon: true,
                  onTap: () => showReturnItemsBottomSheet(
                    context: context,
                    ref: ref,
                    searchController: _searchController,
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
                        ref.read(returnNotifierProvider.notifier).addItem(item);
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
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () =>
                        ref.read(buyNotifierProvider.notifier).clearCart(),
                    child: const Text(
                      'Clear all',
                      style: TextStyle(color: VColors.white),
                    ),
                  ),
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
                  Expanded(child: ReturnedItemList(isCheckout: false)),
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
            if (returnItems.isNotEmpty) {
              final totalPrice = calculateReturnTotalPrice(
                  ref, returnItems); // Update subtotal
              context.pushNamed(
                VRouter.returnCheckout,
                extra: {
                  'returnedItems': returnItems,
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
