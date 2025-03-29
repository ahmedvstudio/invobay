import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/router/router_constant.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

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
                      'Account',
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
                  const VSectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  VSettingsMenuTile(
                    icon: Iconsax.personalcard,
                    title: 'Customers',
                    subTitle: 'Add Customers Details.',
                    onTap: () => context.pushNamed(VRouter.customers),
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.people,
                    title: 'Suppliers',
                    subTitle: 'Add Suppliers Details.',
                    onTap: () => context.pushNamed(VRouter.suppliers),
                  ),

                  const VSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout.'),
                  VSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and Completed Orders.',
                    onTap: () => context.pushNamed(VRouter.orders),
                  ),
                  const VSettingsMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subTitle: 'withdraw balance to registered bank account.'),
                  const VSettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'List of all the discount coupons.'),
                  const VSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subTitle: 'Set any kind of notification message.'),
                  const VSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected accounts.'),

                  // app settings
                  const SizedBox(height: VSizes.spaceBtwSections),
                  const VSectionHeading(
                      title: 'App Settings', showActionButton: false),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  const VSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'Upload Data to your cloud firebase.'),
                  VSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location.',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages.',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen.',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),

                  // logout
                  const SizedBox(height: VSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text('Logout')),
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
