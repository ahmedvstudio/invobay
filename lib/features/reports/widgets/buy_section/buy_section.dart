import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/widgets/list_tiles/report_item.dart';
import 'package:invobay/core/providers/db_providers/hive_providers/app_settings_provider.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:invobay/features/reports/widgets/buy_section/widgets/buy_bottom_sheet.dart';

import '../../../../common/widgets/list_tiles/report_list_tile.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../core/models/report_related_models/top_supplier_model.dart';
import '../../../../core/providers/report_providers/report_related_providers.dart';
import '../../../../core/utils/constants/sizes.dart';

class VBuySection extends ConsumerWidget {
  const VBuySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencySign = ref.watch(currencySignProvider);
    return Column(
      children: [
        VSectionHeading(title: context.loc.buy, showActionButton: false),
        const SizedBox(height: VSizes.spaceBtwItems),
        VReportListTile(
          title: context.loc.topSuppliers,
          icon: Iconsax.user_tag,
          onTap: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => ReportBottomSheet<SupplierSpendModel>(
              title: context.loc.topSuppliers,
              provider: topSuppliersProvider,
              itemBuilder: (supplier, index) => VReportItem(
                  itemNumber: '${index + 1}',
                  itemName: supplier.name,
                  subtitle: context.loc.supplier,
                  trailing: currencySign +
                      VFormatters.formatPrice(supplier.totalSpent)),
            ),
          ),
        ),
        VReportListTile(
          title: context.loc.supplierDebts,
          icon: Iconsax.money_change,
          onTap: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => ReportBottomSheet<SupplierDebtModel>(
              title: context.loc.supplierDebts,
              provider: supplierDebtsProvider,
              itemBuilder: (debt, index) => VReportItem(
                itemNumber: '${index + 1}',
                itemName: debt.name,
                subtitle: context.loc.debt,
                trailing:
                    currencySign + VFormatters.formatPrice(debt.totalDebt),
                trailingColor: VColors.error,
              ),
            ),
          ),
        ),
        VReportListTile(
          title: context.loc.mostBoughtItems,
          icon: Iconsax.money_recive,
          onTap: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => ReportBottomSheet<MostBoughtItemModel>(
              title: context.loc.mostBoughtItems,
              provider: mostBoughtItemsProvider,
              itemBuilder: (item, index) => VReportItem(
                  itemNumber: '${index + 1}',
                  itemName: item.name,
                  subtitle: '${context.loc.qty}: ${item.totalQuantity}',
                  trailing:
                      currencySign + VFormatters.formatPrice(item.totalSpent)),
            ),
          ),
        ),
        VReportListTile(
          title: context.loc.averageCostPerItem,
          icon: Iconsax.align_vertically,
          onTap: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => ReportBottomSheet<ItemAverageCostModel>(
              title: context.loc.averageCostPerItem,
              provider: averageItemCostProvider,
              itemBuilder: (item, index) => VReportItem(
                  itemNumber: '${index + 1}',
                  itemName: item.name,
                  subtitle: context.loc.avgCost,
                  trailing:
                      currencySign + VFormatters.formatPrice(item.averageCost)),
            ),
          ),
        ),
      ],
    );
  }
}
