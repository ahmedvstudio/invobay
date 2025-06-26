import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/widgets/appbar/main_appbar.dart';
import 'package:invobay/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:invobay/core/providers/db_providers/hive_providers/app_settings_provider.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import 'package:invobay/features/sell_buy_return/initial/sell/widgets/customer_and_clear.dart';
import 'package:invobay/features/sell_buy_return/initial/sell/widgets/sell_item_list.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/sheet/sell_buy_return/select_item_sheet.dart';
import '../../../../core/providers/common_providers/update_subtotal_provider.dart';
import '../../../../core/providers/item_providers/item_related_providers.dart';
import '../../../../core/providers/sell_providers/sell_related_providers.dart';
import '../../../../core/providers/theme_providers/theme_related_providers.dart';
import '../../../../core/router/router_constant.dart';
import '../../../../core/utils/buttons/buttons.dart';
import '../../../../core/utils/constants/enums.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/messages/toast.dart';

class SellScreen extends ConsumerWidget {
  SellScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellItems = ref.watch(sellNotifierProvider);
    final primaryColor = ref.watch(primaryColorProvider);
    final locale = ref.watch(localeProvider);
    final isEnglish = VHelperFunctions.isEnglish(locale);

    return Scaffold(
      body: Column(
        children: [
          VPrimaryHeaderContainer(
            child: Column(
              children: [
                VMainAppBar(
                  title: context.loc.sell,
                  appbarIcon: Iconsax.tag5,
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
                VSearchContainer(
                  text: context.loc.searchAndAddItems,
                  showPrefixIcon: true,
                  onTap: () => showItemsBottomSheet(
                    context: context,
                    ref: ref,
                    searchController: _searchController,
                    receiptType: ReceiptType.sell,
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
                        ref.read(sellNotifierProvider.notifier).addItem(item);
                      } else {
                        if (context.mounted) {
                          VToast.warning(message: context.loc.itemNotFound);
                        }
                      }
                    }
                  },
                ),

                // Customer and clear all row
                VCustomerAndClear(
                  clearAllOnPressed: () =>
                      ref.read(sellNotifierProvider.notifier).clearCart(),
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
                  Expanded(child: SellItemList(isCheckout: false)),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Badge(
        label: Text(sellItems.length.toString()),
        isLabelVisible: sellItems.isEmpty ? false : true,
        alignment: isEnglish ? Alignment.topLeft : Alignment.topRight,
        child: VButtons.fab(
          label: context.loc.cart,
          tooltip: context.loc.proceedToCheckout,
          icon: CupertinoIcons.cart_badge_plus,
          color: primaryColor,
          onPressed: () {
            if (sellItems.isNotEmpty) {
              final totalPrice =
                  calculateSellTotalPrice(ref, sellItems); // Update subtotal
              context.pushNamed(
                VRouter.sellCheckout,
                extra: {
                  'soldItems': sellItems,
                  'totalPrice': totalPrice,
                },
              );
            } else {
              VToast.warning(message: context.loc.yourListIsEmpty);
            }
          },
        ),
      ),
    );
  }
}
