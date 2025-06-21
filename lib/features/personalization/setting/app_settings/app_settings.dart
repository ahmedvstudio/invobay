import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/sheet/settings/notification_settings_sheet.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../core/router/router_constant.dart';
import '../../../../core/utils/constants/sizes.dart';

class VAppSettings extends StatelessWidget {
  const VAppSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        VSettingsMenuTile(
          icon: Iconsax.clipboard,
          title: 'About',
          subTitle: 'Application Info And Update.',
          onTap: () => context.pushNamed(VRouter.about),
        ),
      ],
    );
  }
}
