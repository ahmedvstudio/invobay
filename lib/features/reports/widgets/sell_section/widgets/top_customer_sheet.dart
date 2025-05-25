import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/common/widgets/list_tiles/report_item.dart';
import 'package:invobay/common/widgets/text/section_heading.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';

import '../../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../../core/providers/report_providers/report_related_providers.dart';
import '../../../../../core/utils/constants/sizes.dart';

class TopCustomersBottomSheet extends ConsumerWidget {
  const TopCustomersBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topCustomersAsync = ref.watch(topCustomersProvider);
    final currencySign = ref.watch(currencySignProvider);
    return SafeArea(
      child: Padding(
        padding: VSpacingStyle.horizontal,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const VSectionHeading(
                title: 'Top Customers', showActionButton: false),
            const SizedBox(height: VSizes.spaceBtwItems),
            topCustomersAsync.when(
              data: (customers) {
                if (customers.isEmpty) {
                  return const Padding(
                    padding: VSpacingStyle.vertical,
                    child: Text('No data available.'),
                  );
                }
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: customers.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final customer = customers[index];
                      return VReportItem(
                          itemNumber: '${index + 1}',
                          itemName: customer.name,
                          subtitle: 'Top',
                          trailing: currencySign +
                              VFormatters.formatPrice(customer.totalSpent));
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
                child: Text('Error: $e'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
