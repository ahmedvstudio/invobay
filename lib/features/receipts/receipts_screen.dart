import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/features/receipts/return_receipts/return_receipts_screen.dart';
import 'package:invobay/features/receipts/sell_receipts/sell_receipts_screen.dart';

import '../../common/widgets/appbar/main_appbar.dart';
import '../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../core/providers/default_providers.dart';
import '../../core/utils/constants/colors.dart';
import '../../core/utils/constants/sizes.dart';
import '../../core/utils/helpers/helper_functions.dart';
import 'buy_receipts/buy_receipts_screen.dart';

class ReceiptsScreen extends ConsumerWidget {
  const ReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = VHelperFunctions.isDarkMode(context);
    final selectedIndex = ref.watch(receiptsNavigationProvider);

    return Scaffold(
      body: Column(
        children: [
          const VPrimaryHeaderContainer(
            child: Column(
              children: [
                VMainAppBar(
                  title: 'Receipts',
                  appbarIcon: Iconsax.receipt_15,
                ),
                SizedBox(height: VSizes.spaceBtwSections),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: const [
                SellReceiptsScreen(),
                BuyReceiptsScreen(),
                ReturnReceiptsScreen(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        height: 80,
        elevation: 0,
        backgroundColor: isDark ? VColors.black : VColors.white,
        indicatorColor: isDark
            ? VColors.white.withValues(alpha: 0.1)
            : VColors.black.withValues(alpha: 0.1),
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.tag5), label: 'Sell'),
          NavigationDestination(
              icon: Icon(Iconsax.shopping_cart5), label: 'Buy'),
          NavigationDestination(
              icon: Icon(Iconsax.back_square), label: 'Return'),
        ],
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          ref.read(receiptsNavigationProvider.notifier).state = index;
        },
      ),
    );
  }
}
