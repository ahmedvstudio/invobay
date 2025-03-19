import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/widgets/appbar/main_appbar.dart';
import '../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../core/utils/constants/sizes.dart';

class BuyScreen extends StatelessWidget {
  const BuyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          VPrimaryHeaderContainer(
            child: Column(
              children: [
                VMainAppBar(
                  title: 'Buy',
                  appbarIcon: Iconsax.shopping_cart5,
                ),
                SizedBox(height: VSizes.spaceBtwSections),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
