import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/router/router_constant.dart';

import '../../../core/utils/constants/sizes.dart';
import 'big_buttons.dart';

class VHomeBody extends StatelessWidget {
  const VHomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Wrap(
        spacing: VSizes.defaultSpace / 2,
        runSpacing: VSizes.defaultSpace,
        alignment: WrapAlignment.center,
        children: [
          VBigButton(
            onTap: () => context.pushNamed(VRouter.inventory),
            width: double.infinity,
            text: 'Inventory',
            icon: Iconsax.shop,
          ),
          VBigButton(
            onTap: () => context.pushNamed(VRouter.sell),
            text: 'Sell',
            icon: Iconsax.tag,
          ),
          VBigButton(
            onTap: () => context.pushNamed(VRouter.buy),
            text: 'Buy',
            icon: Iconsax.shopping_cart,
          ),
          VBigButton(
            onTap: () => context.pushNamed(VRouter.returns),
            text: 'Return',
            icon: Iconsax.back_square,
          ),
          VBigButton(
            onTap: () => context.pushNamed(VRouter.receipts),
            text: 'Receipts',
            icon: Iconsax.receipt,
          ),
          VBigButton(
            onTap: () => context.pushNamed(VRouter.reports),
            text: 'Reports',
            icon: Iconsax.receipt_item,
          ),
          VBigButton(
            onTap: () => context.pushNamed(VRouter.settings),
            text: 'Settings',
            icon: Iconsax.setting,
          ),
        ],
      ),
    );
  }
}
