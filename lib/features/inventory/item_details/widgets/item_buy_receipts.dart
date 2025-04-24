import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../core/database/drift/app_database.dart';
import '../../../../core/providers/buy_providers/buy_receipt_details_provider.dart';
import '../../../../core/providers/common_providers/default_providers.dart';
import '../../../../core/providers/item_providers/item_related_providers.dart';
import 'item_buy_receipt_section.dart';

class ItemBuyReceiptsScreen extends ConsumerWidget {
  const ItemBuyReceiptsScreen({
    super.key,
    required int itemId,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemProvider = ref.watch(itemNotifierProvider);
    final item = itemProvider.firstWhere((item) => item.name == title,
        orElse: () => Item(
              id: 0,
              name: title,
              quantity: 0.0,
              sellingPrice: 0.0,
              buyingPrice: 0.0,
              description: null,
              barcode: null,
              itemUnit: null,
            ));
    final receiptsAsync = ref.watch(receiptsDetailsProvider(item.id));
    final currencySign = ref.watch(currencySignProvider);
    return Scaffold(
      appBar: VAppBar(
        title: const Text('Item Receipts Details'),
        actions: [
          IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(CupertinoIcons.xmark))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: receiptsAsync.when(
            data: (receipts) {
              if (receipts.isEmpty) {
                return const Text('No receipts found.');
              }
              return VItemBuyReceiptDetails(
                currencySign: currencySign,
                receipts: receipts,
                buyingPrice: item.buyingPrice,
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (e, st) => const Text('Error loading receipts'),
          ),
        ),
      ),
    );
  }
}
