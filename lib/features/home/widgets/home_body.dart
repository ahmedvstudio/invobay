import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/device/device_utility.dart';

import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';
import 'home_button.dart';

class VHomeBody extends StatelessWidget {
  const VHomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Wrap(
        spacing: VSizes.defaultSpace / 2,
        runSpacing: VSizes.defaultSpace,
        alignment: WrapAlignment.center,
        children: [
          VHomeButton(
            width: VDeviceUtils.getScreenWidth(context) * 0.9,
            height: 120,
            title: 'Inventory',
            icon: Iconsax.shop5,
            iconSize: 70,
            bgColor: VColors.secondary,
            borderColor: isDark ? VColors.darkerGrey : VColors.coldSteel,
            onPressed: () => context.pushNamed(VRouter.inventory),
          ),
          VHomeButton(
            title: 'Sell',
            icon: Iconsax.tag5,
            onPressed: () => context.pushNamed(VRouter.sell),
          ),
          VHomeButton(
            title: 'Buy',
            icon: Iconsax.shopping_cart5,
            onPressed: () => context.pushNamed(VRouter.buy),
          ),
          VHomeButton(
            title: 'Return',
            icon: Iconsax.shopping_bag5,
            onPressed: () => context.pushNamed(VRouter.returns),
          ),
          VHomeButton(
            title: 'Receipts',
            icon: Iconsax.receipt_15,
            onPressed: () => context.pushNamed(VRouter.receipts),
          ),
          VHomeButton(
            title: 'Reports',
            icon: Iconsax.receipt_item5,
            onPressed: () => context.pushNamed(VRouter.reports),
          ),
          VHomeButton(
            title: 'Settings',
            icon: Iconsax.cpu_setting5,
            onPressed: () => context.pushNamed(VRouter.settings),
          ),
        ],
      ),
    );
  }
}
