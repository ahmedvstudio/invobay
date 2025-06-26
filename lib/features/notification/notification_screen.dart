import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/utils/buttons/buttons.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
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
      final groupKey =
          VHelperFunctions.getTimeAgoGroup(context, notify.timestamp);
      groupedNotifications.putIfAbsent(groupKey, () => []);
      groupedNotifications[groupKey]?.add(notify);
    }

    return Scaffold(
      body: notifications.isEmpty
          ? Column(
              children: [
                VCustomAppBar(text: context.loc.notifications),
                Flexible(
                    child: Center(child: Text(context.loc.noNotificationYet))),
              ],
            )
          : Column(
              children: [
                VCustomAppBar(text: context.loc.notifications),
                Flexible(
                  child: GroupedNotificationsList(
                    groupedNotifications: groupedNotifications,
                    allNotifications: notifications,
                  ),
                ),
              ],
            ),
      floatingActionButton: VButtons.fab(
        label: context.loc.clearAll,
        tooltip: context.loc.clearAll,
        color: primaryColor,
        icon: Icons.clear_all,
        onPressed: () async {
          final confirm = await showDialog<bool>(
            context: context,
            builder: (context) => VDeleteConfirmDialog(
              isCustomer: false,
              isGeneral: true,
              contentText:
                  context.loc.areYouSureYouWantToDeleteAllNotifications,
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
