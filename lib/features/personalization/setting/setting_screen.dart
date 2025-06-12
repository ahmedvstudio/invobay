import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../common/widgets/sheet/notification_settings_sheet.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            VPrimaryHeaderContainer(
              child: Column(
                children: [
                  VAppBar(
                    title: Text(
                      context.loc.account,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: VColors.white),
                    ),
                  ),

                  // user profile
                  VUserProfileTile(
                    onPressed: () => context.pushNamed(VRouter.profile),
                  ),
                  const SizedBox(height: VSizes.spaceBtwSections),
                ],
              ),
            ),

            // body
            Padding(
              padding: const EdgeInsets.all(VSizes.defaultSpace),
              child: Column(
                children: [
                  // account settings
                  VSectionHeading(
                      title: context.loc.accountSettings,
                      showActionButton: false),
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
                  const SizedBox(height: VSizes.spaceBtwSections),
                  VSectionHeading(
                      title: context.loc.appSettings, showActionButton: false),
                  const SizedBox(height: VSizes.spaceBtwItems),

                  VSettingsMenuTile(
                    icon: Iconsax.brush,
                    title: context.loc.appearance,
                    subTitle: context.loc.personalizeTheAppToYourLiking,
                    onTap: () => context.pushNamed(VRouter.appearance),
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: context.loc.notifications,
                    subTitle: context.loc.setAnyKindOfNotificationMessage,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (_) => const NotificationSettingsBottomSheet(),
                      );
                    },
                  ),

                  const SizedBox(height: VSizes.spaceBtwSections),
                  VSectionHeading(
                      title: context.loc.dataSettings, showActionButton: false),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  VSettingsMenuTile(
                    icon: Iconsax.document_cloud,
                    title: context.loc.syncData,
                    subTitle: context.loc.syncDataToTheCloud,
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.document_download,
                    title: context.loc.backupData,
                    subTitle: context.loc.backupDataToYourLocalStorage,
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: context.loc.loadData,
                    subTitle: context.loc.loadDataFromYourLocalStorage,
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.document_text,
                    title: context.loc.deleteData,
                    subTitle: context.loc.deleteDataFromYourLocalStorage,
                  ),

                  // logout
                  const SizedBox(height: VSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {}, child: Text(context.loc.logout)),
                  ),
                  const SizedBox(height: VSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
