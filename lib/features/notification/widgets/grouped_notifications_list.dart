import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/styles/spacing_style.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/models/notifications/notification_model.dart';
import '../../../core/utils/constants/sizes.dart';

import 'notification_tile.dart';

class GroupedNotificationsList extends ConsumerWidget {
  final Map<String, List<NotificationModel>> groupedNotifications;
  final List<NotificationModel> allNotifications;

  const GroupedNotificationsList({
    super.key,
    required this.groupedNotifications,
    required this.allNotifications,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      itemCount: groupedNotifications.length,
      padding: VSpacingStyle.horizontal,
      itemBuilder: (context, index) {
        final groupKey = groupedNotifications.keys.elementAt(index);
        final groupItems = groupedNotifications[groupKey]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VSectionHeading(title: groupKey, showActionButton: false),
            const SizedBox(height: VSizes.spaceBtwItems / 2),
            ...groupItems.map((notify) {
              final notifyIndex = allNotifications.indexOf(notify);
              return NotificationTile(
                notify: notify,
                index: notifyIndex,
              );
            }),
          ],
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
