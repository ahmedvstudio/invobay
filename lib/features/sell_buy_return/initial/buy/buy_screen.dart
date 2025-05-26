import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/features/sell_buy_return/initial/buy/widgets/buy_item_list.dart';
import 'package:invobay/features/sell_buy_return/initial/buy/widgets/supplier_and_clear.dart';

import '../../../../common/widgets/appbar/main_appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/sheet/sell_buy_return/select_item_sheet.dart';
import '../../../../core/providers/buy_providers/buy_related_providers.dart';
import '../../../../core/providers/common_providers/update_subtotal_provider.dart';
import '../../../../core/providers/item_providers/item_related_providers.dart';
import '../../../../core/router/router_constant.dart';
import '../../../../core/utils/buttons/buttons.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/enums.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/messages/toast.dart';

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
                  showPrefixIcon: true,
                  onTap: () => showItemsBottomSheet(
                    context: context,
                    ref: ref,
                    searchController: _searchController,
                    receiptType: ReceiptType.buy,
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
                        VToast.warning(message: 'Item not found!');
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
      floatingActionButton: VButtons.fab(
        tooltip: 'Proceed to checkout',
        icon: CupertinoIcons.cart_badge_plus,
        color: VColors.primary,
        onPressed: () {
          if (buyItems.isNotEmpty) {
            final subTotalPrice =
                calculateBuyTotalPrice(ref, buyItems); // Update subtotal
            context.pushNamed(
              VRouter.buyCheckout,
              extra: {
                'boughtItems': buyItems,
                'totalPrice': subTotalPrice,
              },
            );
          } else {
            VToast.warning(message: 'Your list is Empty!');
          }
        },
      ),
    );
  }
}
