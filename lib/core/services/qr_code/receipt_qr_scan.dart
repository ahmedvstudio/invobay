import 'package:barcode_scan2/gen/protos/protos.pbenum.dart';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/router_constant.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';

class VReceiptQRScan {
  static Future<void> scanQRCode(BuildContext context, List receipts) async {
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
              message: 'No QR code detected', backgroundColor: VColors.warning);
        }
      }
    } catch (e) {
      VHelperFunctions.showToasty(
          message: 'Failed to scan QR code: $e',
          backgroundColor: VColors.error);
    }
  }
}
