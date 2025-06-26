import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/common/widgets/text/section_heading.dart';
import 'package:invobay/core/providers/theme_providers/theme_related_providers.dart';
import 'package:invobay/core/utils/constants/lists.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../core/providers/notification_providers/notification_related_provider.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';

class NotificationSettingsBottomSheet extends ConsumerWidget {
  const NotificationSettingsBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggles = ref.watch(notificationToggleProvider);
    final notifier = ref.read(notificationToggleProvider.notifier);
    final primaryColor = ref.watch(primaryColorProvider);
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: VSpacingStyle.withoutTop,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              VSectionHeading(
                  title: context.loc.notificationSettings,
                  showActionButton: false),
              const SizedBox(height: VSizes.spaceBtwItems),
              ...VLists.notificationLabels(context).entries.map((entry) {
                final key = entry.key;
                final label = entry.value;
                return SwitchListTile(
                  activeTrackColor: primaryColor,
                  activeColor: VColors.white,
                  dense: true,
                  title: Text(label),
                  value: toggles[key] ?? false,
                  onChanged: (value) => notifier.toggleNotification(key, value),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
