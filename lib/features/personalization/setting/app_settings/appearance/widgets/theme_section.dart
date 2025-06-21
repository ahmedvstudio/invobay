import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/common/widgets/list_tiles/accent_scroll_listview.dart';
import 'package:invobay/core/database/hive/theme/app_theme.dart';
import 'package:invobay/core/providers/theme_providers/theme_related_providers.dart';
import 'package:invobay/core/utils/constants/lists.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

class VThemeSection extends ConsumerWidget {
  const VThemeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(colorIndexProvider);
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
        Text(context.loc.theme),
        const SizedBox(height: VSizes.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: SegmentedButton<AppTheme>(
            segments: [
              ButtonSegment(
                  value: AppTheme.system, label: Text(context.loc.system)),
              ButtonSegment(
                  value: AppTheme.light, label: Text(context.loc.light)),
              ButtonSegment(
                  value: AppTheme.dark, label: Text(context.loc.dark)),
            ],
            selected: <AppTheme>{selectedTheme},
            onSelectionChanged: (newSelection) {
              themeNotifier.setTheme(newSelection.first);
            },
          ),
        ),
        const SizedBox(height: VSizes.spaceBtwSections),
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: VLists.themeColors.length,
            separatorBuilder: (_, index) => const SizedBox(width: VSizes.sm),
            itemBuilder: (_, index) {
              final selectedColor = VLists.themeColors[index];
              return VAccentScroll(
                isSelected: index == selectedIndex,
                backgroundColor: selectedColor,
                onTap: () {
                  ref.read(colorIndexProvider.notifier).setIndex(index);
                },
              );
            },
          ),
        ),
        const SizedBox(height: VSizes.spaceBtwSections),
      ],
    );
  }
}
