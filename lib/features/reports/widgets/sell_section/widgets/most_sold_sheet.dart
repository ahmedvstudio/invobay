import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/common/widgets/list_tiles/report_item.dart';
import 'package:invobay/common/widgets/text/section_heading.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';

import '../../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../../core/providers/report_providers/report_related_providers.dart';
import '../../../../../core/utils/constants/sizes.dart';

class MostSoldItemsBottomSheet extends ConsumerWidget {
  const MostSoldItemsBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(mostSoldItemsProvider);
    final currencySign = ref.watch(currencySignProvider);
    return SafeArea(
      child: Padding(
        padding: VSpacingStyle.horizontal,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSectionHeading(
                title: context.loc.mostSoldItems, showActionButton: false),
            const SizedBox(height: VSizes.spaceBtwItems),
            itemsAsync.when(
              data: (items) {
                if (items.isEmpty) {
                  return Padding(
                    padding: VSpacingStyle.vertical,
                    child: Text(context.loc.noItemsSoldYet),
                  );
                }
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return VReportItem(
                          itemNumber: '${index + 1}',
                          itemName: item.name,
                          subtitle:
                              '${context.loc.qtySold}: ${item.totalQuantity}',
                          trailing: currencySign +
                              VFormatters.formatPrice(item.totalRevenue));
                    },
                  ),
                );
              },
              loading: () => const Padding(
                padding: VSpacingStyle.vertical,
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (e, st) => Padding(
                padding: VSpacingStyle.vertical,
                child: Text('${context.loc.error}: $e'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
