import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/appbar/main_appbar.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../core/utils/constants/sizes.dart';

class BuyReceiptsScreen extends StatelessWidget {
  const BuyReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          VPrimaryHeaderContainer(
            child: Column(
              children: [
                VMainAppBar(
                  title: 'Buy Receipts',
                  appbarIcon: Iconsax.receipt_15,
                ),
                SizedBox(height: VSizes.spaceBtwSections),
              ],
            ),
          ),
          // Flexible(
          //   child: VReceiptItemsList(),
          // ),
        ],
      ),
    );
  }
}
