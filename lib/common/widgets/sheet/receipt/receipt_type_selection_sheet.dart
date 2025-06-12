import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/router/router_constant.dart';

import '../../../../core/providers/theme_providers/theme_related_providers.dart';
import '../../../../core/utils/constants/sizes.dart';

class VReceiptTypeSelectionBottomSheet extends ConsumerWidget {
  const VReceiptTypeSelectionBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = ref.watch(primaryColorProvider);
    return SingleChildScrollView(
      child: Container(
        padding: VSpacingStyle.withoutTop,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Select Receipt Type',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: VSizes.spaceBtwSections),
            ListTile(
              tileColor: primaryColor.withValues(alpha: 0.2),
              onTap: () {
                context.pop();
                context.pushNamed(VRouter.sellReceipts);
              },
              title: Text(
                'Sell Receipts',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              leading: const Icon(Iconsax.tag5),
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            ListTile(
              tileColor: primaryColor.withValues(alpha: 0.2),
              onTap: () {
                context.pop();
                context.pushNamed(VRouter.buyReceipts);
              },
              title: Text(
                'Buy Receipts',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              leading: const Icon(Iconsax.shopping_cart5),
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            ListTile(
              tileColor: primaryColor.withValues(alpha: 0.2),
              onTap: () {
                context.pop();
                context.pushNamed(VRouter.returnReceipts);
              },
              title: Text(
                'Return Receipts',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              leading: const Icon(Iconsax.shopping_bag5),
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
