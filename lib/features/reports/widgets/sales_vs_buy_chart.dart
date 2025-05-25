import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/providers/db_providers/hive_providers/app_settings_provider.dart';
import 'package:invobay/features/reports/widgets/payment_method_colors.dart';

import '../../../common/widgets/text/key_value_text.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/providers/report_providers/sales_vs_buy_providers.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

class VSalesVsBuyCharts extends ConsumerWidget {
  const VSalesVsBuyCharts({
    super.key,
    required this.dateRange,
  });

  final DateTimeRange dateRange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyDataAsync = ref.watch(weeklySalesPurchasesProvider(dateRange));
    final salesByPaymentAsync =
        ref.watch(salesByPaymentMethodProvider(dateRange));
    final taxAsync = ref.watch(taxCollectedProvider(dateRange));
    final currencySign = ref.watch(currencySignProvider);

    return weeklyDataAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error: $e')),
      data: (weeklyData) {
        return Column(
          children: [
            const VSectionHeading(
                title: 'Sales vs Purchases', showActionButton: false),
            const SizedBox(height: VSizes.spaceBtwItems),
            AspectRatio(
              aspectRatio: 1.7,
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) {
                          final days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                          return Text(days[value.toInt() % 7]);
                        },
                      ),
                    ),
                  ),
                  barGroups: List.generate(weeklyData.length, (i) {
                    final dayData = weeklyData[i];
                    return BarChartGroupData(
                      x: i,
                      barsSpace: 6,
                      barRods: [
                        BarChartRodData(
                          toY: (dayData['sales'] as num?)?.toDouble() ?? 0,
                          color: Colors.blue,
                          width: 12,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        BarChartRodData(
                          toY: (dayData['buys'] as num?)?.toDouble() ?? 0,
                          color: Colors.orange,
                          width: 12,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    );
                  }),
                  groupsSpace: 16,
                ),
              ),
            ),
            const SizedBox(height: VSizes.spaceBtwSections),
            salesByPaymentAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) =>
                  Center(child: Text('Error loading payment methods: $e')),
              data: (paymentData) {
                final methodColors = {
                  'Cash': VColors.success,
                  'MasterCard': VColors.info,
                  'Bank Transfer': VColors.warning,
                };

                final sections = <PieChartSectionData>[];
                final legendWidgets = <Widget>[];

                paymentData.forEach((method, values) {
                  final color = methodColors[method] ?? Colors.grey;
                  final total = values['total'] as double? ?? 0;
                  final count = values['count'] as int? ?? 0;

                  sections.add(PieChartSectionData(
                    value: total,
                    color: color,
                    title: count.toString(), // Show count of receipts here
                    titleStyle: const TextStyle(color: VColors.white),
                  ));

                  legendWidgets
                      .add(PaymentMethodColors(title: method, color: color));
                });

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VKeyValueText('Sales by Payment Method', ''),
                    const SizedBox(height: VSizes.spaceBtwItems),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: legendWidgets,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 120,
                            child: PieChart(
                              PieChartData(
                                sections: sections,
                                sectionsSpace: 2,
                                centerSpaceRadius: 28,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            taxAsync.when(
              loading: () => const CircularProgressIndicator(),
              error: (e, st) => Text('Error loading tax: $e'),
              data: (taxTotal) {
                return VKeyValueText(
                  "Tax Collected",
                  "$currencySign${taxTotal.toStringAsFixed(2)}",
                );
              },
            ),
          ],
        );
      },
    );
  }
}
