import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/list_tiles/report_list_tile.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/models/report_related_models/top_supplier_model.dart';
import '../../../core/providers/report_providers/report_related_providers.dart';
import '../../../core/utils/constants/sizes.dart';

class VBuySection extends ConsumerWidget {
  const VBuySection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const VSectionHeading(title: 'Buy', showActionButton: false),
        const SizedBox(height: VSizes.spaceBtwItems),
        VReportListTile(
          title: 'Top suppliers',
          icon: Iconsax.user_tag,
          onTap: () => showDialog(
            context: context,
            builder: (_) => ReportDialog<SupplierSpendModel>(
              title: 'Top Suppliers',
              provider: topSuppliersProvider,
              itemBuilder: (supplier) => ListTile(
                title: Text(supplier.name),
                subtitle:
                    Text('Total: ${supplier.totalSpent.toStringAsFixed(2)}'),
              ),
            ),
          ),
        ),
        VReportListTile(
          title: 'Debt to the Supplier',
          icon: Iconsax.money_change,
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => ReportDialog<SupplierDebtModel>(
                title: 'Supplier Debts',
                provider: supplierDebtsProvider,
                itemBuilder: (debt) => ListTile(
                  title: Text(debt.name),
                  subtitle: Text('Debt: ${debt.totalDebt.toStringAsFixed(2)}'),
                ),
              ),
            );
          },
        ),
        VReportListTile(
          title: 'Most Bought Items',
          icon: Iconsax.money_recive,
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => ReportDialog<MostBoughtItemModel>(
                title: 'Most Bought Items',
                provider: mostBoughtItemsProvider,
                itemBuilder: (item) => ListTile(
                  title: Text(item.name),
                  subtitle: Text(
                      'Qty: ${item.totalQuantity}, Spent: ${item.totalSpent.toStringAsFixed(2)}'),
                ),
              ),
            );
          },
        ),
        VReportListTile(
          title: 'Average cost per item',
          icon: Iconsax.align_vertically,
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => ReportDialog<ItemAverageCostModel>(
                title: 'Average Cost per Item',
                provider: averageItemCostProvider,
                itemBuilder: (item) => ListTile(
                  title: Text(item.name),
                  subtitle:
                      Text('Avg Cost: ${item.averageCost.toStringAsFixed(2)}'),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class ReportDialog<T> extends ConsumerWidget {
  final String title;
  final AutoDisposeStreamProvider<List<T>> provider;
  final Widget Function(T data) itemBuilder;

  const ReportDialog({
    super.key,
    required this.title,
    required this.provider,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(provider);

    return AlertDialog(
      title: Text(title),
      content: dataAsync.when(
        data: (items) => items.isEmpty
            ? const Text('No data available.')
            : SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: items.map(itemBuilder).toList(),
                ),
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Text('Error: $e'),
      ),
    );
  }
}
