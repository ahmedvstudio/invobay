import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/appbar/main_appbar.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../core/providers/buy_providers/buy_related_providers.dart';
import '../../../core/providers/item_providers/item_related_providers.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';
import '../buy/widgets/supplier_and_clear.dart';

class ReturnsScreen extends ConsumerWidget {
  const ReturnsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          VPrimaryHeaderContainer(
            child: Column(
              children: [
                const VMainAppBar(
                  title: 'Return',
                  appbarIcon: Iconsax.back_square,
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
                VSearchContainer(
                  text: 'Search and Add Items',
                  showPrefixIcon: true,
                  onTap: () {},
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
        ],
      ),
    );
  }
}
