import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../features/inventory/item_details/widgets/meta_data_section.dart';

class MoreItemInfoSheet extends StatelessWidget {
  const MoreItemInfoSheet({
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
    final buyTotal = buyPrice * stock;
    final sellTotal = sellPrice * stock;
    final profit = sellTotal - buyTotal;

    return Padding(
      padding: VSpacingStyle.withoutTop,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.loc.moreInfo,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: VSizes.spaceBtwItems),
          VMetaDataSection(
            tag: context.loc.buyingTotal,
            tagBackgroundColor: VColors.info,
            tagTextColor: VColors.white,
            showIcon: false,
            child: Text(
              '$currencySign ${buyTotal.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: VSizes.spaceBtwItems),
          VMetaDataSection(
            tag: context.loc.sellingTotal,
            tagBackgroundColor: VColors.info,
            tagTextColor: VColors.white,
            showIcon: false,
            child: Text(
              '$currencySign ${sellTotal.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const Divider(),
          VMetaDataSection(
            tag: context.loc.profitMargin,
            tagBackgroundColor: VColors.success,
            tagTextColor: VColors.white,
            showIcon: false,
            child: Text(
              '$currencySign ${profit.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: VSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => context.pop(),
              child: Text(context.loc.close),
            ),
          ),
        ],
      ),
    );
  }
}
