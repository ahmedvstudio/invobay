import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/common/widgets/list_tiles/report_item.dart';
import 'package:invobay/common/widgets/text/section_heading.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';

import '../../../../../common/styles/spacing_style.dart';
import '../../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../../core/providers/report_providers/report_related_providers.dart';
import '../../../../../core/utils/constants/colors.dart';

class CustomerDebtsBottomSheet extends ConsumerWidget {
  const CustomerDebtsBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debtorsAsync = ref.watch(customerDebtsProvider);
    final currencySign = ref.watch(currencySignProvider);
    return SafeArea(
      child: Padding(
        padding: VSpacingStyle.horizontal,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSectionHeading(
                title: context.loc.customerDebts, showActionButton: false),
            const SizedBox(height: VSizes.spaceBtwItems),
            debtorsAsync.when(
              data: (debtors) {
                if (debtors.isEmpty) {
                  return Padding(
                    padding: VSpacingStyle.vertical,
                    child: Text(context.loc.noDebtorsFound),
                  );
                }
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: debtors.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final debtor = debtors[index];
                      return VReportItem(
                        itemNumber: '${index + 1}',
                        itemName: debtor.name,
                        subtitle: context.loc.debt,
                        trailing: currencySign +
                            VFormatters.formatPrice(debtor.totalDebt),
                        trailingColor: VColors.error,
                      );
                    },
                  ),
                );
              },
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (e, st) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Text('${context.loc.error}: $e'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
