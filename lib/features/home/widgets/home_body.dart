import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../common/widgets/sheet/receipt/receipt_type_selection_sheet.dart';
import '../../../core/utils/constants/sizes.dart';
import 'home_button.dart';
import 'inventory_status.dart';

class VHomeBody extends StatelessWidget {
  const VHomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: VSpacingStyle.horizontal,
      child: Column(
        children: [
          const VInventoryStatus(),
          const SizedBox(height: VSizes.spaceBtwItems),
          VHomeButton(
            title: context.loc.inventory,
            icon: Iconsax.shop5,
            onTap: () => context.pushNamed(VRouter.inventory),
          ),
          const SizedBox(height: VSizes.spaceBtwItems),
          Row(
            children: [
              Expanded(
                child: VHomeButton(
                  title: context.loc.sell,
                  icon: Iconsax.tag5,
                  onTap: () => context.pushNamed(VRouter.sell),
                ),
              ),
              const SizedBox(width: VSizes.spaceBtwItems),
              Expanded(
                child: VHomeButton(
                  title: context.loc.buy,
                  icon: Iconsax.shopping_cart5,
                  onTap: () => context.pushNamed(VRouter.buy),
                ),
              ),
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwItems),
          Row(
            children: [
              Expanded(
                child: VHomeButton(
                  title: context.loc.returns,
                  icon: Iconsax.shopping_bag5,
                  onTap: () => context.pushNamed(VRouter.returns),
                ),
              ),
              const SizedBox(width: VSizes.spaceBtwItems),
              Expanded(
                child: VHomeButton(
                  title: context.loc.receipts,
                  icon: Iconsax.receipt_15,
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
                ),
              ),
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwItems),
          Row(
            children: [
              Expanded(
                child: VHomeButton(
                  title: context.loc.reports,
                  icon: Iconsax.receipt_item5,
                  onTap: () => context.pushNamed(VRouter.reports),
                ),
              ),
              const SizedBox(width: VSizes.spaceBtwItems),
              Expanded(
                child: VHomeButton(
                  title: context.loc.settings,
                  icon: Iconsax.setting_45,
                  onTap: () => context.pushNamed(VRouter.settings),
                ),
              ),
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwItems),
        ],
      ),
    );
  }
}
