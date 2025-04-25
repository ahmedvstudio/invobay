import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../common/widgets/appbar/main_appbar.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../core/providers/buy_providers/buy_related_providers.dart';
import '../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../core/router/router_constant.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/formatters/formatters.dart';
import '../../../core/utils/helpers/helper_functions.dart';
import '../widgets/receipt_card_list.dart';

class BuyReceiptsScreen extends ConsumerWidget {
  const BuyReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buyReceiptData = ref.watch(buyReceiptsProvider);
    final currencySign = ref.watch(currencySignProvider);
    return Scaffold(
      body: Column(
        children: [
          const VPrimaryHeaderContainer(
            child: Column(
              children: [
                VMainAppBar(
                  title: 'Buy Receipts',
                  appbarIcon: Iconsax.receipt_15,
                ),
                SizedBox(height: VSizes.spaceBtwSections),
              ],
            ),
          ),
          Expanded(
            child: buyReceiptData.when(
              data: (receipts) {
                final items = receipts.map((receipt) {
                  return {
                    'id': receipt.id.toString(),
                    'paymentStatus': receipt.paymentStatus,
                    'date': DateFormat.yMMMd().format(receipt.date),
                    'receiptId': VHelperFunctions.receiptNo(receipt.id),
                    'total':
                        '$currencySign ${VFormatters.formatPrice(receipt.totalPrice)}',
                  };
                }).toList();

                return VReceiptCardList(
                  items: items,
                  onTap: (id) => context.pushNamed(VRouter.buyReceiptsDetails,
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
