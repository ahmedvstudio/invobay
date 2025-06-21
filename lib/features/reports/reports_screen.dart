import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/features/reports/widgets/buy_section/buy_section.dart';
import 'package:invobay/features/reports/widgets/inventory_section/inventory_section.dart';
import 'package:invobay/features/reports/widgets/profile_and_loss.dart';

import 'package:invobay/features/reports/widgets/report_summary_cards.dart';
import 'package:invobay/features/reports/widgets/return_section/returns_section.dart';
import 'package:invobay/features/reports/widgets/sales_vs_buy_chart.dart';
import 'package:invobay/features/reports/widgets/sell_section/sell_section.dart';

import '../../common/widgets/appbar/main_appbar.dart';
import '../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../core/utils/constants/sizes.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const VPrimaryHeaderContainer(
            child: Column(
              children: [
                VMainAppBar(
                  title: 'Reports',
                  appbarIcon: Iconsax.receipt_item5,
                ),
                SizedBox(height: VSizes.spaceBtwSections),
                // Filter and Export buttons
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: VSpacingStyle.withoutTop,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Summary Cards
                  const VSummaryCards(),
                  const SizedBox(height: VSizes.spaceBtwSections),

                  /// Inventory Section
                  const VInventorySection(),
                  const SizedBox(height: VSizes.spaceBtwSections),

                  /// Sell Section
                  const VSellSection(),
                  const SizedBox(height: VSizes.spaceBtwSections),

                  /// Buy Section
                  const VBuySection(),
                  const SizedBox(height: VSizes.spaceBtwSections),

                  /// Returns Section
                  const VReturnsSection(),
                  const SizedBox(height: VSizes.spaceBtwSections),

                  /// Sales VS Buy Chart
                  VSalesVsBuyCharts(),
                  const SizedBox(height: VSizes.spaceBtwSections),

                  /// Profit & Loss
                  const VProfitAndLoss(),
                  const SizedBox(height: VSizes.spaceBtwSections),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
