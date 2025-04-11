import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/features/receipts/return_receipts/return_receipts_screen.dart';
import 'package:invobay/features/receipts/sell_receipts/sell_receipts_screen.dart';
import '../../core/providers/common_providers/default_providers.dart';
import '../../core/utils/constants/colors.dart';
import 'buy_receipts/buy_receipts_screen.dart';

class ReceiptsScreen extends ConsumerWidget {
  const ReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          ref.read(receiptsNavigationProvider.notifier).state = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.tag),
            label: 'Sell',
            activeIcon: Icon(
              Iconsax.tag5,
            ),
            backgroundColor: VColors.kPrimary,
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.shopping_cart),
            label: 'Buy',
            activeIcon: Icon(Iconsax.shopping_cart5),
            backgroundColor: VColors.kPrimary,
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.directbox_receive),
            label: 'Return',
            activeIcon: Icon(Iconsax.directbox_receive5),
            backgroundColor: VColors.kPrimary,
          ),
        ],
      ),
    );
  }
}
