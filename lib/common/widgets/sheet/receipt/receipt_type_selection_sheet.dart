import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/common/widgets/list_tiles/receipt_type_list_tile.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../core/utils/constants/sizes.dart';

class VReceiptTypeSelectionBottomSheet extends StatelessWidget {
  const VReceiptTypeSelectionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: VSpacingStyle.withoutTop,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(context.loc.selectReceiptType,
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: VSizes.spaceBtwSections),
            ReceiptTypeListTile(
              receiptType: context.loc.sellReceipts,
              icon: Iconsax.tag5,
              onTap: () {
                context.pop();
                context.pushNamed(VRouter.sellReceipts);
              },
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            ReceiptTypeListTile(
              receiptType: context.loc.buyReceipts,
              icon: Iconsax.shopping_cart5,
              onTap: () {
                context.pop();
                context.pushNamed(VRouter.buyReceipts);
              },
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            ReceiptTypeListTile(
              receiptType: context.loc.returnReceipts,
              icon: Iconsax.shopping_bag5,
              onTap: () {
                context.pop();
                context.pushNamed(VRouter.returnReceipts);
              },
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
