import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/features/receipts/return_receipts/return_receipts_screen.dart';
import 'package:invobay/features/receipts/sell_receipts/sell_receipts_screen.dart';
import '../../core/providers/default_providers.dart';
import '../../core/utils/constants/colors.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          ref.read(receiptsNavigationProvider.notifier).state = index;
        },
        backgroundColor: isDark ? VColors.black : VColors.white,
        selectedItemColor: isDark ? VColors.white : VColors.black,
        unselectedItemColor: isDark
            ? VColors.white.withValues(alpha: 0.5)
            : VColors.black.withValues(alpha: 0.5),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.tag5),
            label: 'Sell',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.shopping_cart5),
            label: 'Buy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.back_square),
            label: 'Return',
          ),
        ],
      ),
    );
  }
}
