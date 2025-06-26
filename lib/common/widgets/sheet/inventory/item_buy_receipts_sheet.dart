import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/common/widgets/text/section_heading.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../core/database/drift/app_database.dart';
import '../../../../core/providers/buy_providers/buy_receipt_details_provider.dart';
import '../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../core/providers/item_providers/item_related_providers.dart';
import '../../../../features/inventory/item_details/widgets/item_buy_receipt_section.dart';
import '../../../styles/spacing_style.dart';

class ItemBuyReceiptsBottomSheet extends ConsumerWidget {
  const ItemBuyReceiptsBottomSheet({
    super.key,
    required this.itemId,
    required this.title,
  });

  final int itemId;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemProvider = ref.watch(itemNotifierProvider);
    final item = itemProvider.firstWhere(
      (item) => item.name == title,
      orElse: () => Item(
        id: itemId,
        name: title,
        quantity: 0.0,
        sellingPrice: 0.0,
        buyingPrice: 0.0,
        description: null,
        barcode: null,
        itemUnit: null,
      ),
    );
    final receiptsAsync = ref.watch(receiptsDetailsProvider(item.id));
    final currencySign = ref.watch(currencySignProvider);

    return Padding(
      padding: VSpacingStyle.withoutTop,
      child: Column(
        children: [
          VSectionHeading(
              title: context.loc.itemReceiptsDetails, showActionButton: false),
          const SizedBox(height: VSizes.spaceBtwItems),
          Expanded(
            child: SingleChildScrollView(
              child: receiptsAsync.when(
                data: (receipts) {
                  if (receipts.isEmpty) {
                    return Text(context.loc.noReceiptsFound);
                  }
                  return VItemBuyReceiptDetails(
                    currencySign: currencySign,
                    receipts: receipts,
                    buyingPrice: item.buyingPrice,
                  );
                },
                loading: () => const Padding(
                  padding: VSpacingStyle.vertical,
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (e, st) => Text(context.loc.errorLoadingReceipts),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
