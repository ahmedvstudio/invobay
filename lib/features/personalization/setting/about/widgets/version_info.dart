import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../core/utils/messages/logger.dart';

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
          return const VSettingsMenuTile(
            icon: Iconsax.info_circle,
            title: 'Version',
            subTitle: 'Loading...',
          );
        } else if (snapshot.hasError) {
          Vlogger.error('Error in getAppVersion: ${snapshot.error}');
          return const VSettingsMenuTile(
            icon: Iconsax.info_circle,
            title: 'Version',
            subTitle: 'Failed to load version',
          );
        }
        return VSettingsMenuTile(
          icon: Iconsax.info_circle,
          title: 'Version',
          subTitle: snapshot.data!,
        );
      },
    );
  }
}
