import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../common/widgets/text/key_value_text.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../core/providers/report_providers/report_related_providers.dart';
import '../../../core/utils/constants/sizes.dart';

class VProfitAndLoss extends ConsumerWidget {
  const VProfitAndLoss({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(profitStatsProvider);
    final returns = ref.watch(totalReturnProvider);
    final currencySign = ref.watch(currencySignProvider);
    final revenue = stats.totalSales;
    final cogs = stats.totalCOGS;
    final profit = stats.profit;
    final marginPercent =
        revenue > 0 ? ((profit / revenue) * 100).toStringAsFixed(1) : "0";

    return Column(
      children: [
        VSectionHeading(
            title: context.loc.profitAndLossStatement, showActionButton: false),
        const SizedBox(height: VSizes.spaceBtwItems),
        VKeyValueText(context.loc.grossRevenue,
            "$currencySign${revenue.toStringAsFixed(0)}"),
        VKeyValueText(
            context.loc.cOGS, "$currencySign${cogs.toStringAsFixed(0)}"),
        VKeyValueText(context.loc.returnLoss,
            "$currencySign${returns.toStringAsFixed(0)}"),
        VKeyValueText(context.loc.profitMargin,
            "$marginPercent% / $currencySign${profit.toStringAsFixed(0)}"),
      ],
    );
  }
}
