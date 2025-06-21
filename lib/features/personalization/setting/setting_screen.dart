import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/features/personalization/setting/shop_settings/shop_settings.dart';

import '../../../common/widgets/appbar/main_appbar.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../core/utils/constants/sizes.dart';
import 'app_settings/app_settings.dart';
import 'data_settings/data_settings.dart';

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
                  VMainAppBar(
                    title: context.loc.settings,
                    appbarIcon: Iconsax.setting_2,
                  ),
                  const SizedBox(height: VSizes.spaceBtwSections),
                ],
              ),
            ),

            // body
            const Padding(
              padding: EdgeInsets.all(VSizes.defaultSpace),
              child: Column(
                children: [
                  // account settings
                  VShopSetting(),

                  SizedBox(height: VSizes.spaceBtwSections),
                  VDataSettings(),

                  SizedBox(height: VSizes.spaceBtwSections),
                  VAppSettings(),

                  SizedBox(height: VSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
