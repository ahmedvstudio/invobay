import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/providers/update_providers/update_related_providers.dart';
import 'package:invobay/core/utils/constants/font_strings.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/constants/url_text.dart';
import 'package:invobay/core/utils/device/device_utility.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/features/personalization/setting/app_settings/about/widgets/social_about.dart';
import 'package:invobay/features/personalization/setting/app_settings/about/widgets/version_info.dart';

import '../../../../../common/styles/spacing_style.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../../core/providers/theme_providers/theme_related_providers.dart';
import '../../../../../core/router/router_constant.dart';
import '../../../../../core/utils/constants/image_strings.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = ref.watch(primaryColorProvider);
    final inAppUpdateService = ref.read(inAppUpdateProvider);
    final lastCheckedAsync = ref.watch(lastCheckedStringProvider);

    return Scaffold(
      appBar: VAppBar(title: Text(context.loc.about), showBackArrow: true),
      body: SingleChildScrollView(
        padding: VSpacingStyle.all,
        child: Column(
          children: [
            const SizedBox(height: VSizes.spaceBtwItems),
            Image.asset(height: 100, VImages.appLogo, color: primaryColor),
            Text('INVOBAY',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontFamily: VFonts.poppinsFamily)),
            const SizedBox(height: VSizes.spaceBtwSections),
            const Divider(),
            const SizedBox(height: VSizes.spaceBtwItems),
            const VersionInfo(),
            VSettingsMenuTile(
              icon: Iconsax.refresh,
              title: context.loc.checkForUpdate,
              subTitle: lastCheckedAsync.when(
                data: (lastCheckedString) => lastCheckedString,
                loading: () => context.loc.checking,
                error: (error, stack) => context.loc.errorFetchingUpdateInfo,
              ),
              onTap: () {
                inAppUpdateService.checkAndUpdate(
                    context: context, showUI: true);
              },
            ),
            VSettingsMenuTile(
              icon: Iconsax.document_text,
              title: context.loc.openSourceLicense,
              onTap: () => context.pushNamed(VRouter.openSourceLicense),
            ),
            VSettingsMenuTile(
                icon: Iconsax.security,
                title: context.loc.privacyPolicy,
                onTap: () => VDeviceUtils.launchCustomUrl(VUrl.privacyPolicy)),
            VSettingsMenuTile(
                icon: Iconsax.document_copy,
                title: context.loc.termsOfUse,
                onTap: () => VDeviceUtils.launchCustomUrl(VUrl.termsOfUse)),
            const SizedBox(height: VSizes.spaceBtwSections),

            // --> Social Buttons
            VSocialAbout(iconColor: primaryColor),
            const SizedBox(height: VSizes.spaceBtwItems),

            Text(
              '©️${DateTime.now().year} Ahmed V. Studio',
              style: Theme.of(context).textTheme.labelMedium,
              textDirection: TextDirection.ltr,
            ),
            const SizedBox(height: VSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
