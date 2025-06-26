import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/constants/lists.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../styles/spacing_style.dart';

Future<void> showLanguageSelectionBottomSheet(
    BuildContext context, WidgetRef ref) async {
  final currentLocale = ref.watch(localeProvider);
  final appSettingsNotifier = ref.read(appSettingsProvider.notifier);

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius:
          BorderRadius.vertical(top: Radius.circular(VSizes.defaultSpace)),
    ),
    builder: (ctx) {
      return Padding(
        padding: VSpacingStyle.withoutTop,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.loc.selectAppLanguage,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: VLists.languages.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final lang = VLists.languages[index];
                final langCode = lang['code']!;
                final langLabel = lang['label']!;

                return RadioListTile<String>(
                  tileColor: Colors.transparent,
                  value: langCode,
                  groupValue: currentLocale.languageCode,
                  title: Text(langLabel),
                  onChanged: (value) {
                    if (value != null) {
                      appSettingsNotifier.updateLanguage(value);
                      context.pop(ctx);
                    }
                  },
                );
              },
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
          ],
        ),
      );
    },
  );
}
