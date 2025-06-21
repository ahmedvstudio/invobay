import 'package:flutter/material.dart';
import 'package:invobay/common/widgets/appbar/appbar.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/features/personalization/setting/app_settings/appearance/widgets/display_section.dart';
import 'package:invobay/features/personalization/setting/app_settings/appearance/widgets/general_section.dart';
import 'package:invobay/features/personalization/setting/app_settings/appearance/widgets/theme_section.dart';

class AppearanceScreen extends StatelessWidget {
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VAppBar(title: Text(context.loc.appearance), showBackArrow: true),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(VSizes.defaultSpace),
        child: Column(
          children: [
            /// --> Theme
            VThemeSection(),

            /// --> Display
            VDisplaySection(),

            /// --> General
            VGeneralSection(),
          ],
        ),
      ),
    );
  }
}
