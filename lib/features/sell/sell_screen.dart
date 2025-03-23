import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/widgets/appbar/main_appbar.dart';
import 'package:invobay/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:invobay/features/sell/widgets/items_bottom_sheet.dart';
import 'package:invobay/features/sell/widgets/sell_item_list.dart';
import '../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../common/widgets/dialogs/customer_name_dialog.dart';
import '../../core/models/sell_model.dart';
import '../../core/providers/customer_provider.dart';
import '../../core/providers/sell_provider.dart';
import '../../core/router/router_constant.dart';
import '../../core/utils/constants/colors.dart';
import '../../core/utils/constants/sizes.dart';
import '../../core/utils/helpers/helper_functions.dart';

class SellScreen extends ConsumerWidget {
  SellScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

// Calculate total price
  double calculateTotalPrice(List<SellItem> sellItems) {
    double total = 0;
    for (var sellItem in sellItems) {
      total += sellItem.item.sellingPrice * sellItem.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellItems = ref.watch(sellProvider);

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer(
                      builder: (context, ref, _) {
                        final customerName = ref.watch(customerNameProvider);
                        return TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => const VCustomerNameDialog(),
                            );
                          },
                          child: Text(
                            'Customer:\n$customerName',
                            style: const TextStyle(color: VColors.white),
                          ),
                        );
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        ref.read(sellProvider.notifier).clearCart();
                      },
                      child: const Text(
                        'Clear all',
                        style: TextStyle(color: VColors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: VSizes.defaultSpace, right: VSizes.defaultSpace),
              child: Column(
                children: [
                  const SellItemList(),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total:'),
                      Text(calculateTotalPrice(sellItems).toStringAsFixed(2)),
                    ],
                  ),
                  const Divider(),

                  // Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (sellItems.isNotEmpty) {
                          context.pushNamed(
                            VRouter.sellReceipt, // Use named route
                            extra: {
                              'soldItems': sellItems,
                              'totalPrice': calculateTotalPrice(sellItems),
                            },
                          );
                        } else {
                          VHelperFunctions.showToasty(
                              message: 'No items to Sell !',
                              backgroundColor: VColors.warning,
                              textColor: VColors.black);
                        }
                      },
                      child: const Text(
                        'Proceed',
                      ),
                    ),
                  ),

                  const SizedBox(height: VSizes.spaceBtwSections),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
