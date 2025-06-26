import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../../core/utils/messages/logger.dart';

class VersionInfo extends StatelessWidget {
  const VersionInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: VHelperFunctions.getAppVersion(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return VSettingsMenuTile(
            icon: Iconsax.info_circle,
            title: context.loc.version,
            subTitle: '${context.loc.loading}...',
          );
        } else if (snapshot.hasError) {
          Vlogger.error(
              '${context.loc.errorGettingAppVersion} ${snapshot.error}');
          return VSettingsMenuTile(
            icon: Iconsax.info_circle,
            title: context.loc.version,
            subTitle: context.loc.failedToLoadVersion,
          );
        }
        return VSettingsMenuTile(
          icon: Iconsax.info_circle,
          title: context.loc.version,
          subTitle: snapshot.data!,
        );
      },
    );
  }
}
