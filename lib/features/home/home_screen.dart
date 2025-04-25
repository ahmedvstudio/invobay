import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/features/home/widgets/home_appbar.dart';
import 'package:invobay/features/home/widgets/home_body.dart';

import '../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../common/widgets/text/marquee_text.dart';
import '../../common/widgets/text/shop_name.dart';
import '../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../core/providers/item_providers/item_related_providers.dart';
import '../../core/router/router_constant.dart';
import '../../core/utils/constants/sizes.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemNotifierProvider);
    final threshold = ref.watch(lowStockThresholdProvider);
    final lowStockItems =
        items.where((item) => item.quantity <= threshold).toList();

    final marqueeText = lowStockItems.isEmpty
        ? "Items stock looks good"
        : "Low stock item${lowStockItems.length > 1 ? 's' : ''}: ${lowStockItems.length}";
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            VPrimaryHeaderContainer(
              child: Column(
                children: [
                  const VHomeAppBar(),
                  const SizedBox(height: VSizes.spaceBtwSections),

                  const VShopName(),
                  const SizedBox(height: VSizes.spaceBtwSections),

                  // SearchBar
                  VSearchContainer(
                    text: 'Search in stock',
                    onTap: () => context.pushNamed(VRouter.inventory),
                  ),
                  const SizedBox(height: VSizes.spaceBtwSections),

                  // -- Low Stock items (Live Updating)
                  MarqueeText(
                    longText: marqueeText,
                    backgroundColor: lowStockItems.isEmpty
                        ? Colors.transparent
                        : VColors.info,
                    onTap: () => context.pushNamed(VRouter.lowStockScreen),
                  ),
                  const SizedBox(height: VSizes.spaceBtwSections * 1.5),
                ],
              ),
            ),

            // -- Buttons
            const VHomeBody(),
            const SizedBox(height: VSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
