import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/widgets/appbar/main_appbar.dart';

import '../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../core/utils/constants/sizes.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          VPrimaryHeaderContainer(
            child: Column(
              children: [
                VMainAppBar(
                  title: 'Sell',
                  appbarIcon: Iconsax.tag5,
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
