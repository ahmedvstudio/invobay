import 'package:barcode_scan2/gen/protos/protos.pbenum.dart';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/providers/common_providers/default_providers.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:intl/intl.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import 'package:invobay/features/receipts/widgets/receipt_card_list.dart';

import '../../../core/providers/sell_providers/sell_related_providers.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../common/widgets/appbar/main_appbar.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../core/utils/formatters/formatters.dart';

class SellReceiptsScreen extends ConsumerWidget {
  const SellReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiptData = ref.watch(sellReceiptsProvider);
    final currencySign = ref.watch(currencySignProvider);

    Future<void> scanQRCode(List receipts) async {
      try {
        var result = await BarcodeScanner.scan();

        if (result.type == ResultType.Barcode) {
          final scannedData = result.rawContent;
          if (scannedData.isNotEmpty) {
            // Parse scanned data: expecting format "YYYY-####"
            final parts = scannedData.split('-');
            if (parts.length == 2) {
              final yearPart = parts[0];
              final idPart = parts[1];

              // Optional: Validate yearPart matches current year or acceptable range
              final currentYear = DateTime.now().year.toString();
              if (yearPart != currentYear) {
                VHelperFunctions.showToasty(
                  message: 'Receipt year not found!',
                  backgroundColor: VColors.warning,
                );
                return;
              }

              // Remove leading zeros to get numeric id string if needed, or keep padded:
              final receiptId = int.tryParse(idPart)?.toString() ?? idPart;

              // Check if receipt exists by matching id as String or int
              final found =
                  receipts.any((receipt) => receipt.id.toString() == receiptId);

              if (found) {
                if (!context.mounted) return;
                context.pushNamed(
                  VRouter.sellReceiptsDetails,
                  pathParameters: {'id': receiptId},
                );
              } else {
                VHelperFunctions.showToasty(
                    message: 'Receipt not found',
                    backgroundColor: VColors.warning);
              }
            } else {
              VHelperFunctions.showToasty(
                  message: 'Invalid QR code format',
                  backgroundColor: VColors.warning);
            }
          } else {
            VHelperFunctions.showToasty(
                message: 'No QR code detected',
                backgroundColor: VColors.warning);
          }
        }
      } catch (e) {
        VHelperFunctions.showToasty(
            message: 'Failed to scan QR code: $e',
            backgroundColor: VColors.error);
      }
    }

    return Scaffold(
      body: Column(
        children: [
          VPrimaryHeaderContainer(
            child: Column(
              children: [
                receiptData.when(
                  data: (receipts) => VMainAppBar(
                    title: 'Sell Receipts',
                    appbarIcon: Iconsax.scan_barcode,
                    onPressed: () => scanQRCode(receipts),
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
            child: receiptData.when(
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
