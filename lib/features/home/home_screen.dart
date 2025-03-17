import 'package:flutter/material.dart';
import 'package:invobay/features/home/widgets/home_body.dart';

import '../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../common/widgets/text/shop_name.dart';
import '../../core/utils/constants/colors.dart';
import '../../core/utils/constants/sizes.dart';
import '../../common/widgets/text/marquee_text.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            VPrimaryHeaderContainer(
              child: Column(
                children: [
                  // AppBar
                  VHomeAppBar(),
                  SizedBox(height: VSizes.spaceBtwSections),

                  VShopName(),
                  SizedBox(height: VSizes.spaceBtwSections),

                  // SearchBar
                  VSearchContainer(text: 'Search in store'),
                  SizedBox(height: VSizes.spaceBtwSections),

                  // -- Low Stock items
                  MarqueeText(
                    longText: 'low stock items alert',
                    textColor: VColors.white,
                  ),
                  SizedBox(height: VSizes.spaceBtwSections * 1.5),
                ],
              ),
            ),

            // -- Buttons
            VHomeBody(),
            SizedBox(height: VSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
