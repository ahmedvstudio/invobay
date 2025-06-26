import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/features/personalization/setting/app_settings/about/license/widgets/load_licenses.dart';

import '../../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../../core/router/router_constant.dart';
import 'widgets/oss_licenses.dart';

class OpenSourceLicensesScreen extends StatelessWidget {
  const OpenSourceLicensesScreen({super.key});

  static final _licenses = loadFilteredLicenses();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VAppBar(
          title: Text(context.loc.openSourceLicense), showBackArrow: true),
      body: FutureBuilder<List<Package>>(
        future: _licenses,
        builder: (context, snapshot) {
          final licenses = snapshot.data ?? [];

          return ListView.separated(
            padding: VSpacingStyle.withoutTop,
            itemCount: licenses.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final package = licenses[index];
              return ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(package.name),
                trailing:
                    package.version.isNotEmpty ? Text(package.version) : null,
                onTap: () =>
                    context.pushNamed(VRouter.licenseDetail, extra: package),
              );
            },
          );
        },
      ),
    );
  }
}
