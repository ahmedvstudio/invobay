import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/features/reports/widgets/buy_section.dart';
import 'package:invobay/features/reports/widgets/inventory_section.dart';
import 'package:invobay/features/reports/widgets/profile_and_loss.dart';

import 'package:invobay/features/reports/widgets/report_summary_cards.dart';
import 'package:invobay/features/reports/widgets/returns_section.dart';
import 'package:invobay/features/reports/widgets/sales_vs_buy_chart.dart';
import 'package:invobay/features/reports/widgets/sell_section.dart';

import '../../common/widgets/appbar/main_appbar.dart';
import '../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../core/services/printing/sdsdsds.dart';
import '../../core/utils/constants/sizes.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          VPrimaryHeaderContainer(
            child: Column(
              children: [
                const VMainAppBar(
                  title: 'Reports',
                  appbarIcon: Iconsax.receipt_item5,
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
                // Filter and Export buttons

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: VSizes.defaultSpace),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Iconsax.filter),
                        label: const Text('Filter'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          //TODO handle later
                          // Trigger the PDF export
                          generateAndPrintReportPDF(
                              salesSummary: '',
                              purchaseSummary: '',
                              profitSummary: '',
                              topItems: [],
                              lowStockItems: [],
                              returnSummary: '');
                        },
                        icon: const Icon(Iconsax.export),
                        label: const Text('Export PDF'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: VSizes.spaceBtwSections),
              ],
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              padding: VSpacingStyle.withoutTop,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Summary Cards
                  VSummaryCards(),
                  SizedBox(height: VSizes.spaceBtwSections),

                  /// Inventory Section
                  VInventorySection(),
                  SizedBox(height: VSizes.spaceBtwSections),

                  /// Sell Section
                  VSellSection(),
                  SizedBox(height: VSizes.spaceBtwSections),

                  /// Buy Section
                  VBuySection(),
                  SizedBox(height: VSizes.spaceBtwSections),

                  /// Returns Section
                  VReturnsSection(),
                  SizedBox(height: VSizes.spaceBtwSections),

                  /// Sales VS Buy Chart
                  VSalesVsBuyCharts(),
                  SizedBox(height: VSizes.spaceBtwSections),

                  /// Profit & Loss
                  VProfitAndLoss(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
