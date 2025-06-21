import 'package:flutter/material.dart';
import 'package:invobay/common/styles/spacing_style.dart';

import '../../../../../../../common/widgets/appbar/appbar.dart';
import 'oss_licenses.dart';

class LicenseDetailPage extends StatelessWidget {
  final Package package;

  const LicenseDetailPage({super.key, required this.package});

  String get _cleanedLicenseText {
    return package.license!
        .split('\n')
        .map((line) =>
            line.startsWith('//') ? line.substring(2).trim() : line.trim())
        .join('\n');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VAppBar(
        title: Text('${package.name} ${package.version}'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: VSpacingStyle.all,
        child: SelectableText(_cleanedLicenseText),
      ),
    );
  }
}
