import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/widgets/appbar/main_appbar.dart';
import '../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../core/database/app_database.dart';
import '../../core/utils/constants/colors.dart';
import '../../core/utils/constants/sizes.dart';
import '../../core/utils/helpers/helper_functions.dart';

final receiptsProvider = FutureProvider((ref) async {
  final db = AppDatabase.getInstance();
  return db.getReceipts();
});

class ReceiptScreen extends ConsumerWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = VHelperFunctions.isDarkMode(context);
    final receiptsAsync = ref.watch(receiptsProvider);

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
            child: receiptsAsync.when(
              data: (receipts) {
                if (receipts.isEmpty) {
                  return const Center(child: Text("No receipts found."));
                }
                return ListView.builder(
                  itemCount: receipts.length,
                  itemBuilder: (context, index) {
                    final receipt = receipts[index];
                    return ListTile(
                      leading: const Icon(Iconsax.receipt),
                      title: Text("Receipt #${receipt.id}"),
                      subtitle: Text(
                        "Total: \$${receipt.totalPrice.toStringAsFixed(2)}\nDate: ${receipt.date}",
                      ),
                      onTap: () {
                        // TODO: Navigate to receipt details screen
                      },
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(
                child: Text("Error: $error"),
              ),
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
        ],
      ),
    );
  }
}
