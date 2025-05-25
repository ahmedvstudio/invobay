import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/features/home/widgets/home_appbar.dart';
import 'package:invobay/features/home/widgets/home_body.dart';
import 'package:invobay/features/home/widgets/inventory_status.dart';

import '../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../common/widgets/text/shop_name.dart';
import '../../core/router/router_constant.dart';
import '../../core/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    text: context.loc.searchInStock,
                    onTap: () => context.pushNamed(VRouter.inventory,
                        queryParameters: {'openSearch': 'true'}),
                  ),
                  const SizedBox(height: VSizes.spaceBtwItems * 1.5),
                  const VInventoryStatus(),

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
