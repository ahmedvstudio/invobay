import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/common/widgets/text/section_heading.dart';

import '../../../core/providers/notification_providers/notification_related_provider.dart';
import '../../../core/utils/constants/sizes.dart';

class NotificationSettingsBottomSheet extends ConsumerWidget {
  const NotificationSettingsBottomSheet({super.key});

  static const Map<String, String> notificationLabels = {
    'all': 'All Notifications',
    'low_stock': 'Low Stock',
    'out_of_stock': 'Out of Stock',
    'sell_checkout': 'Sell Checkout',
    'buy_checkout': 'Buy Checkout',
    'return_checkout': 'Return Checkout',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggles = ref.watch(notificationToggleProvider);
    final notifier = ref.read(notificationToggleProvider.notifier);

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: VSpacingStyle.withoutTop,
          child: Wrap(
            children: [
              const VSectionHeading(
                  title: 'Notification Settings', showActionButton: false),
              const SizedBox(height: VSizes.spaceBtwSections),
              const Divider(),
              ...notificationLabels.entries.map((entry) {
                final key = entry.key;
                final label = entry.value;
                return SwitchListTile(
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
