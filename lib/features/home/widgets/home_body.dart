import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/router/router_constant.dart';

import '../../../common/widgets/sheet/receipt/receipt_type_selection_sheet.dart';
import '../../../core/utils/constants/sizes.dart';
import 'rounded_button.dart';

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
          VRoundedButton(
            width: double.infinity,
            onTap: () => context.pushNamed(VRouter.inventory),
            title: 'Inventory',
            icon: Icons.shopping_basket,
            iconColor: Colors.amber,
          ),
          VRoundedButton(
            onTap: () => context.pushNamed(VRouter.sell),
            title: 'Sell',
            icon: Iconsax.tag5,
          ),
          VRoundedButton(
            onTap: () => context.pushNamed(VRouter.buy),
            title: 'Buy',
            icon: Iconsax.shopping_cart5,
          ),
          VRoundedButton(
            onTap: () => context.pushNamed(VRouter.returns),
            title: 'Return',
            icon: Iconsax.shopping_bag5,
          ),
          VRoundedButton(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(VSizes.defaultSpace)),
                ),
                builder: (_) => const VReceiptTypeSelectionBottomSheet(),
              );
            },
            title: 'Receipts',
            icon: Iconsax.receipt_15,
          ),
          VRoundedButton(
            onTap: () => context.pushNamed(VRouter.reports),
            title: 'Reports',
            icon: Iconsax.receipt_item5,
          ),
          VRoundedButton(
            onTap: () => context.pushNamed(VRouter.settings),
            title: 'Settings',
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}
