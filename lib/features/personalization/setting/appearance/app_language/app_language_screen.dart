import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/common/widgets/appbar/appbar.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/providers/localization_related_providers/local_provider.dart';

class AppLanguageScreen extends ConsumerWidget {
  const AppLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localProvider);
    final localeNotifier = ref.read(localProvider.notifier);

    final languages = [
      {'code': 'en', 'label': 'English'},
      {'code': 'ar', 'label': 'العربية'},
    ];

    return Scaffold(
      appBar: const VAppBar(
        title: Text('App Language'),
        showBackArrow: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(VSizes.defaultSpace / 2),
        itemCount: languages.length,
        separatorBuilder: (_, __) => const SizedBox(),
        itemBuilder: (context, index) {
          final lang = languages[index];
          final langCode = lang['code']!;
          final langLabel = lang['label']!;

          return RadioListTile<String>(
            tileColor: Colors.transparent,
            value: langCode,
            groupValue: currentLocale.languageCode,
            title: Text(langLabel),
            onChanged: (value) {
              if (value != null) {
                localeNotifier.setLocale(value);
              }
            },
          );
        },
      ),
    );
  }
}
