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
import '../../core/utils/constants/sizes.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          VPrimaryHeaderContainer(
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
