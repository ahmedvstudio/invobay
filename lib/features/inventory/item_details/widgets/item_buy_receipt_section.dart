import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/text/brand_title_text_with_verification_icon.dart';
import '../../../../core/models/buy_related_model/buy_receipt_with_item_details_model.dart';
import '../../../../core/providers/supplier_providers/supplier_related_providers.dart';
import '../../../../core/router/router_constant.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';

class VItemBuyReceiptDetails extends StatelessWidget {
  const VItemBuyReceiptDetails({
    super.key,
    required this.currencySign,
    required this.receipts,
    required this.buyingPrice,
  });
  final List<BuyReceiptWithItemDetails> receipts;
  final String currencySign;
  final double buyingPrice;

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return Column(
      children: receipts.map((receipt) {
        return VRoundedContainer(
          margin: const EdgeInsets.only(bottom: VSizes.sm),
          backgroundColor: isDark ? VColors.dark : VColors.light,
          child: ListTile(
            onTap: () => context.pushNamed(
              VRouter.buyReceiptsDetails,
              pathParameters: {'id': '${receipt.receiptId}'},
            ),
            title: Text(
              '${receipt.quantity} × $currencySign ${receipt.itemPrice}',
              style: const TextStyle().copyWith(
                  color:
                      receipt.itemPrice > buyingPrice ? VColors.error : null),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${context.loc.receiptNo}. #${receipt.receiptId}'),
                Consumer(
                  builder: (context, ref, child) {
                    final supplierAsync =
                        ref.watch(supplierByIdProvider(receipt.supplierId!));
                    return supplierAsync.when(
                      data: (supplier) {
                        return VBrandTitleTextWithVerificationIcon(
                          title: supplier?.name ?? context.loc.supplier,
                        );
                      },
                      loading: () => Text("${context.loc.loading}..."),
                      error: (error, stackTrace) =>
                          Text(context.loc.errorLoadingSupplier),
                    );
                  },
                ),
              ],
            ),
            subtitle: Text(VFormatters.formatDate(receipt.receiptDate)),
          ),
        );
      }).toList(),
    );
  }
}
