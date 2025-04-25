import 'package:flutter/material.dart';
import 'package:invobay/common/widgets/appbar/appbar.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/features/personalization/setting/appearance/widgets/display_section.dart';
import 'package:invobay/features/personalization/setting/appearance/widgets/general_section.dart';
import 'package:invobay/features/personalization/setting/appearance/widgets/theme_section.dart';

class AppearanceScreen extends StatelessWidget {
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: VAppBar(title: Text('Appearance'), showBackArrow: true),
      body: SingleChildScrollView(
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
