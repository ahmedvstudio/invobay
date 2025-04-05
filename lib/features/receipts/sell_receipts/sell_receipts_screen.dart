import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/providers/default_providers.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:intl/intl.dart';

import '../../../core/providers/sell_related_providers/sell_receipts_provider.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../common/widgets/appbar/main_appbar.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../widgets/receipt_items_list.dart';

class SellReceiptsScreen extends ConsumerWidget {
  const SellReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiptData = ref.watch(sellReceiptsProvider);
    final currencySign = ref.watch(currencySignProvider);

    return Scaffold(
      body: Column(
        children: [
          const VPrimaryHeaderContainer(
            child: Column(
              children: [
                VMainAppBar(
                  title: 'Sell Receipts',
                  appbarIcon: Iconsax.receipt_15,
                ),
                SizedBox(height: VSizes.spaceBtwSections),
              ],
            ),
          ),
          Expanded(
            child: receiptData.when(
              data: (receipts) {
                final items = receipts.map((receipt) {
                  return {
                    'id': receipt.id.toString(),
                    'paymentMethod': receipt.paymentMethod,
                    'date': DateFormat.yMMMd().format(receipt.date),
                    'receiptId': '[#${receipt.id}]',
                    'total': '$currencySign ${receipt.totalPrice}',
                  };
                }).toList();

                return VReceiptItemsList(
                  items: items,
                  onTap: (id) => context.pushNamed(VRouter.sellReceiptsDetails,
                      pathParameters: {'id': id}),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text("Error: $error")),
            ),
          ),
        ],
      ),
    );
  }
}
