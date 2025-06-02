import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:invobay/core/providers/db_providers/hive_providers/app_settings_provider.dart';
import 'package:invobay/features/reports/widgets/payment_method_colors.dart';

import '../../../common/widgets/text/key_value_text.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/providers/common_providers/default_providers.dart';
import '../../../core/providers/report_providers/weekly_data_provider.dart';
import '../../../core/providers/report_providers/tax_collected_provider.dart';
import '../../../core/providers/report_providers/sales_by_payment_provider.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

class VSalesVsBuyCharts extends ConsumerWidget {
  VSalesVsBuyCharts({
    super.key,
  });
  final List<String> months = [];
  final Map<int, String> firstMonthAppearance = {};

  void prepareMonthLabels(List<Map<String, dynamic>> weeklyData) {
    Set<String> seenMonths = {};
    for (int i = 0; i < weeklyData.length; i++) {
      DateTime? date;
      if (weeklyData[i]['date'] is DateTime) {
        date = weeklyData[i]['date'];
      } else if (weeklyData[i]['date'] is String) {
        date = DateTime.tryParse(weeklyData[i]['date']);
      }
      if (date != null) {
        String month = DateFormat.MMM().format(date);
        if (!seenMonths.contains(month)) {
          seenMonths.add(month);
          firstMonthAppearance[i] = month;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateRange = ref.watch(dateRangeProvider);
    final weeklyDataAsync = ref.watch(weeklySalesPurchasesProvider(dateRange));
    final salesByPaymentAsync =
        ref.watch(salesByPaymentMethodProvider(dateRange));
    final taxAsync = ref.watch(taxCollectedProvider(dateRange));
    final currencySign = ref.watch(currencySignProvider);

    return weeklyDataAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error: $e')),
      data: (weeklyData) {
        prepareMonthLabels(weeklyData);

        return Column(
          children: [
            VSectionHeading(
              title: 'Sales vs Purchases',
              buttonTitle: 'change range',
              onPressed: () async {
                final picked = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                  initialDateRange: dateRange,
                );
                if (picked != null) {
                  ref.read(dateRangeProvider.notifier).state = picked;
                }
              },
            ),
            VKeyValueText("From", dateRange.start.toString().substring(0, 10)),
            VKeyValueText("To", dateRange.end.toString().substring(0, 10)),
            const SizedBox(height: VSizes.spaceBtwItems),
            AspectRatio(
              aspectRatio: 1.7,
              child: LineChart(
                LineChartData(
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) {
                          final index = value.toInt();
                          final label = firstMonthAppearance[index];
                          return label != null
                              ? Text(label)
                              : const SizedBox.shrink();
                        },
                      ),
                    ),
                  ),
                  minY: 0,
                  lineBarsData: [
                    // Sales Line
                    LineChartBarData(
                      spots: List.generate(weeklyData.length, (i) {
                        final sales =
                            (weeklyData[i]['sales'] as num?)?.toDouble() ?? 0;
                        return FlSpot(i.toDouble(),
                            double.parse(sales.toStringAsFixed(2)));
                      }),
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 3,
                      dotData: const FlDotData(show: false),
                    ),
                    // Buys Line
                    LineChartBarData(
                      spots: List.generate(weeklyData.length, (i) {
                        final buys =
                            (weeklyData[i]['buys'] as num?)?.toDouble() ?? 0;
                        return FlSpot(i.toDouble(),
                            double.parse(buys.toStringAsFixed(2)));
                      }),
                      isCurved: true,
                      color: Colors.orange,
                      barWidth: 3,
                      dotData: const FlDotData(show: false),
                    ),
                  ],
                  gridData: const FlGridData(show: false),
                  lineTouchData: const LineTouchData(enabled: true),
                ),
              ),
            ),
            const SizedBox(height: VSizes.spaceBtwSections),
            salesByPaymentAsync.when(
              data: (paymentData) {
                final methodColors = {
                  'Cash': VColors.success,
                  'MasterCard': VColors.info,
                  'Bank Transfer': VColors.warning,
                };

                final sections = <PieChartSectionData>[];
                final legendWidgets = <Widget>[];

                paymentData.forEach((method, values) {
                  final color = methodColors[method] ?? VColors.grey;
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
                                sectionsSpace: 1,
                                centerSpaceRadius: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) =>
                  Center(child: Text('Error loading payment methods: $e')),
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            taxAsync.when(
              loading: () => const CircularProgressIndicator(),
              error: (e, st) => Text('Error loading tax: $e'),
              data: (taxTotal) {
                return VKeyValueText(
                  "Tax Collected",
                  "$currencySign${taxTotal.toStringAsFixed(3)}",
                );
              },
            ),
          ],
        );
      },
    );
  }
}
