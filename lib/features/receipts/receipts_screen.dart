import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/features/receipts/return_receipts/return_receipts_screen.dart';
import 'package:invobay/features/receipts/sell_receipts/sell_receipts_screen.dart';
import '../../core/providers/common_providers/default_providers.dart';
import 'buy_receipts/buy_receipts_screen.dart';

class ReceiptsScreen extends ConsumerWidget {
  const ReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(receiptsNavigationProvider);
    final bgColor = ref.watch(appbarColorProvider);
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
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Iconsax.tag),
            label: 'Sell',
            activeIcon: const Icon(
              Iconsax.tag5,
            ),
            backgroundColor: bgColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Iconsax.shopping_cart),
            label: 'Buy',
            activeIcon: const Icon(Iconsax.shopping_cart5),
            backgroundColor: bgColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Iconsax.directbox_receive),
            label: 'Return',
            activeIcon: const Icon(Iconsax.directbox_receive5),
            backgroundColor: bgColor,
          ),
        ],
      ),
    );
  }
}
