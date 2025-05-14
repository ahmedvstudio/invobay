import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:invobay/features/reports/widgets/payment_method_colors.dart';

import '../../../common/widgets/text/key_value_text.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

class VSalesVsBuyCharts extends StatelessWidget {
  const VSalesVsBuyCharts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              barGroups: List.generate(7, (i) {
                return BarChartGroupData(x: i, barRods: [
                  BarChartRodData(
                    toY: (i + 1) * 10,
                    color: Colors.blue,
                    width: 12,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ]);
              }),
            ),
          ),
        ),
        const SizedBox(height: VSizes.spaceBtwSections),
        const VKeyValueText('Sales by Payment Method', ''),
        const SizedBox(height: VSizes.spaceBtwItems),
        Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PaymentMethodColors(title: 'Cash', color: VColors.success),
                PaymentMethodColors(title: 'MasterCard', color: VColors.info),
                PaymentMethodColors(
                    title: 'Bank Transfer', color: VColors.warning),
              ],
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: 40,
                        color: VColors.success,
                        titleStyle: const TextStyle(color: VColors.white),
                      ),
                      PieChartSectionData(
                        value: 50,
                        color: VColors.info,
                        titleStyle: const TextStyle(color: VColors.white),
                      ),
                      PieChartSectionData(
                        value: 10,
                        color: VColors.warning,
                        titleStyle: const TextStyle(color: VColors.white),
                      ),
                    ],
                    sectionsSpace: 2,
                    centerSpaceRadius: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        const VKeyValueText("Tax Collected", "₹2,500"),
      ],
    );
  }
}
