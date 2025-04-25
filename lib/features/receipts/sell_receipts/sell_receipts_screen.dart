import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:intl/intl.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import 'package:invobay/features/receipts/widgets/receipt_card_list.dart';

import '../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../core/providers/sell_providers/sell_related_providers.dart';
import '../../../core/services/qr_code/receipt_qr_scan.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../common/widgets/appbar/main_appbar.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../core/utils/formatters/formatters.dart';

class SellReceiptsScreen extends ConsumerWidget {
  const SellReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellReceiptData = ref.watch(sellReceiptsProvider);
    final currencySign = ref.watch(currencySignProvider);

    return Scaffold(
      body: Column(
        children: [
          VPrimaryHeaderContainer(
            child: Column(
              children: [
                sellReceiptData.when(
                  data: (receipts) => VMainAppBar(
                    title: 'Sell Receipts',
                    appbarIcon: Iconsax.scan_barcode,
                    onPressed: () =>
                        VReceiptQRScan.scanQRCode(context, receipts),
                  ),
                  loading: () => VMainAppBar(
                      title: 'Sell Receipts',
                      appbarIcon: Iconsax.scan_barcode,
                      onPressed: () {}),
                  error: (_, __) => VMainAppBar(
                      title: 'Sell Receipts',
                      appbarIcon: Iconsax.scan_barcode,
                      onPressed: () {}),
                ),
                const SizedBox(height: VSizes.spaceBtwSections),
              ],
            ),
          ),
          Expanded(
            child: sellReceiptData.when(
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
