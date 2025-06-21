import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/utils/buttons/buttons.dart';
import 'package:invobay/features/notification/widgets/grouped_notifications_list.dart';

import '../../common/widgets/dialogs/delete_confirm_dialog.dart';
import '../../core/models/notifications/notification_model.dart';
import '../../core/providers/notification_providers/notification_related_provider.dart';
import '../../common/widgets/appbar/custom_appbar.dart';
import '../../core/providers/theme_providers/theme_related_providers.dart';
import '../../core/utils/helpers/helper_functions.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationsProvider);
    final groupedNotifications = <String, List<NotificationModel>>{};
    final primaryColor = ref.watch(primaryColorProvider);
    for (var notify in notifications) {
      final groupKey = VHelperFunctions.getTimeAgoGroup(notify.timestamp);
      groupedNotifications.putIfAbsent(groupKey, () => []);
      groupedNotifications[groupKey]?.add(notify);
    }

    return Scaffold(
      body: notifications.isEmpty
          ? const Column(
              children: [
                VCustomAppBar(text: 'Notifications'),
                Flexible(child: Center(child: Text("No notifications yet."))),
              ],
            )
          : Column(
              children: [
                const VCustomAppBar(text: 'Notifications'),
                Flexible(
                  child: GroupedNotificationsList(
                    groupedNotifications: groupedNotifications,
                    allNotifications: notifications,
                  ),
                ),
              ],
            ),
      floatingActionButton: VButtons.fab(
        label: "Clear All",
        tooltip: "Clear All",
        color: primaryColor,
        icon: Icons.clear_all,
        onPressed: () async {
          final confirm = await showDialog<bool>(
            context: context,
            builder: (context) => const VDeleteConfirmDialog(
              isCustomer: false,
              isGeneral: true,
              contentText: 'Are you sure you want to delete all notifications?',
            ),
          );
          if (confirm == true) {
            await ref.read(notificationsProvider.notifier).clearAll();
          }
        },
      ),
    );
  }
}
