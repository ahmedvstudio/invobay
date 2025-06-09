import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../common/widgets/sheet/receipt/receipt_type_selection_sheet.dart';
import '../../../core/utils/constants/sizes.dart';
import 'rounded_button.dart';

class VHomeBody extends StatelessWidget {
  const VHomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: VSpacingStyle.halfHorizontal,
          child: VRoundedButton(
            width: double.infinity,
            onTap: () => context.pushNamed(VRouter.inventory),
            title: context.loc.inventory,
            icon: Icons.shopping_basket,
            iconColor: Colors.amber,
          ),
        ),
        const SizedBox(height: VSizes.defaultSpace),
        Wrap(
          spacing: VSizes.defaultSpace / 2,
          runSpacing: VSizes.defaultSpace,
          alignment: WrapAlignment.center,
          children: [
            VRoundedButton(
              onTap: () => context.pushNamed(VRouter.sell),
              title: context.loc.sell,
              icon: Iconsax.tag5,
            ),
            VRoundedButton(
              onTap: () => context.pushNamed(VRouter.buy),
              title: context.loc.buy,
              icon: Iconsax.shopping_cart5,
            ),
            VRoundedButton(
              onTap: () => context.pushNamed(VRouter.returns),
              title: context.loc.returns,
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
              title: context.loc.receipts,
              icon: Iconsax.receipt_15,
            ),
            VRoundedButton(
              onTap: () => context.pushNamed(VRouter.reports),
              title: context.loc.reports,
              icon: Iconsax.receipt_item5,
            ),
            VRoundedButton(
              onTap: () => context.pushNamed(VRouter.settings),
              title: context.loc.settings,
              icon: Icons.settings,
            ),
          ],
        ),
      ],
    );
  }
}
