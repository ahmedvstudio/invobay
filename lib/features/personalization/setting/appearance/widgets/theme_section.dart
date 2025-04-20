import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/database/hive/theme/app_theme.dart';
import '../../../../../core/providers/common_providers/theme_provider.dart';
import '../../../../../core/utils/constants/sizes.dart';

class VThemeSection extends ConsumerWidget {
  const VThemeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeModeProvider.notifier);
    final selectedTheme = ref.watch(themeModeProvider.select((themeMode) {
      switch (themeMode) {
        case ThemeMode.light:
          return AppTheme.light;
        case ThemeMode.dark:
          return AppTheme.dark;
        default:
          return AppTheme.system;
      }
    }));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Theme:'),
        const SizedBox(height: VSizes.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: SegmentedButton<AppTheme>(
            segments: const [
              ButtonSegment(value: AppTheme.system, label: Text('System')),
              ButtonSegment(value: AppTheme.light, label: Text('Light')),
              ButtonSegment(value: AppTheme.dark, label: Text('Dark')),
            ],
            selected: <AppTheme>{selectedTheme},
            onSelectionChanged: (newSelection) {
              themeNotifier.setTheme(newSelection.first);
            },
          ),
        ),
        const SizedBox(height: VSizes.spaceBtwSections),
      ],
    );
  }
}
