import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../core/router/router_constant.dart';
import '../../../../core/utils/constants/sizes.dart';

class VShopSetting extends StatelessWidget {
  const VShopSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSectionHeading(
            title: context.loc.shopSettings, showActionButton: false),
        const SizedBox(height: VSizes.spaceBtwItems),
        VSettingsMenuTile(
          icon: Iconsax.personalcard,
          title: context.loc.customers,
          subTitle: context.loc.addLoyalCustomersDetails,
          onTap: () => context.pushNamed(VRouter.customers),
        ),
        VSettingsMenuTile(
          icon: Iconsax.people,
          title: context.loc.suppliers,
          subTitle: context.loc.addYourSuppliersDetails,
          onTap: () => context.pushNamed(VRouter.suppliers),
        ),
        VSettingsMenuTile(
          icon: Iconsax.dollar_square,
          title: context.loc.vaultExpense,
          subTitle: context.loc.addYourVaultAndExpenseDetails,
          onTap: () => context.pushNamed(VRouter.vault),
        ),
        VSettingsMenuTile(
          icon: Iconsax.shop,
          title: context.loc.shopDetails,
          subTitle: context.loc.addShopDetails,
          onTap: () => context.pushNamed(VRouter.shopDetails),
        ),
      ],
    );
  }
}
