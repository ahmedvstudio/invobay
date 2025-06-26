import 'package:flutter/foundation.dart';

import 'oss_licenses.dart';

Future<List<Package>> loadFilteredLicenses() async {
  final lm = <String, List<String>>{};
  await for (var l in LicenseRegistry.licenses) {
    for (var p in l.packages) {
      if (p.toLowerCase() == 'js') continue;
      final lp = lm.putIfAbsent(p, () => []);
      lp.addAll(l.paragraphs.map((p) => p.text));
    }
  }

  final licenses = allDependencies.toList();
  for (var key in lm.keys) {
    licenses.add(Package(
      name: key,
      description: '',
      authors: [],
      version: '',
      license: lm[key]!.join('\n\n'),
      isMarkdown: false,
      isSdk: false,
      dependencies: [],
    ));
  }

  return licenses..sort((a, b) => a.name.compareTo(b.name));
}
