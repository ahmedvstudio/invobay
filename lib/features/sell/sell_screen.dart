import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/widgets/appbar/main_appbar.dart';
import 'package:invobay/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:invobay/features/sell/widgets/customer_and_clear.dart';
import 'package:invobay/features/sell/widgets/items_bottom_sheet.dart';
import 'package:invobay/features/sell/widgets/sell_item_list.dart';
import '../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../core/providers/db_notifiers/app_providers.dart';
import '../../core/providers/sell_related_providers/update_subtotal_provider.dart';
import '../../core/router/router_constant.dart';
import '../../core/utils/constants/colors.dart';
import '../../core/utils/constants/sizes.dart';
import '../../core/utils/helpers/helper_functions.dart';

class SellScreen extends ConsumerWidget {
  SellScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

// Calculate total price

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellItems = ref.watch(sellNotifierProvider);

    return Scaffold(
      body: Column(
        children: [
          VPrimaryHeaderContainer(
            child: Column(
              children: [
                const VMainAppBar(
                  title: 'Sell',
                  appbarIcon: Iconsax.tag5,
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
                VSearchContainer(
                  text: 'Search and Add Items',
                  onTap: () =>
                      showItemsBottomSheet(context, ref, _searchController),
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
                  // Checkout Button
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
            if (sellItems.isNotEmpty) {
              final totalPrice =
                  calculateTotalPrice(ref, sellItems); // Update subtotal

              context.pushNamed(
                VRouter.sellCheckout,
                extra: {
                  'soldItems': sellItems,
                  'totalPrice': totalPrice,
                },
              );
            } else {
              VHelperFunctions.showToasty(
                message: 'No items to Sell!',
                backgroundColor: VColors.warning,
                textColor: VColors.black,
              );
            }
          },
          child: const Text('Proceed to checkout'),
        ),
      ),
    );
  }
}
