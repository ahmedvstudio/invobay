import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../features/item_details/widgets/meta_data_section.dart';

class VMoreItemInfoDialog extends StatelessWidget {
  const VMoreItemInfoDialog({
    super.key,
    required this.currencySign,
    required this.buyPrice,
    required this.stock,
    required this.sellPrice,
  });

  final String currencySign;
  final double buyPrice;
  final double stock;
  final double sellPrice;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('More info'),
      content: Column(
        spacing: VSizes.spaceBtwItems,
        mainAxisSize: MainAxisSize.min,
        children: [
          VMetaDataSection(
            tag: 'Buying Total',
            tagBackgroundColor: VColors.info,
            tagTextColor: VColors.white,
            showIcon: false,
            child: Text(
              '$currencySign ${buyPrice * stock}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          VMetaDataSection(
            tag: 'Selling Total',
            tagBackgroundColor: VColors.info,
            tagTextColor: VColors.white,
            showIcon: false,
            child: Text(
              '$currencySign ${sellPrice * stock}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const Divider(),
          VMetaDataSection(
            tag: 'Profit Margin',
            tagBackgroundColor: VColors.success,
            tagTextColor: VColors.white,
            showIcon: false,
            child: Text(
              '$currencySign ${(sellPrice * stock) - (buyPrice * stock)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
