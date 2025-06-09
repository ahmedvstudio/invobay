import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

import '../../core/models/notifications/notification_model.dart';
import '../../core/providers/notification_providers/notification_provider.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationsProvider);
    final groupedNotifications = <String, List<NotificationModel>>{};

    for (var notify in notifications) {
      final groupKey = VHelperFunctions.getTimeAgoGroup(notify.timestamp);
      groupedNotifications.putIfAbsent(groupKey, () => []);
      groupedNotifications[groupKey]?.add(notify);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.trash),
            tooltip: "Clear All",
            onPressed: () async {
              await ref.read(notificationsProvider.notifier).clearAll();
            },
          ),
        ],
      ),
      body: notifications.isEmpty
          ? const Center(child: Text("No notifications yet."))
          : ListView.builder(
              itemCount: groupedNotifications.length,
              itemBuilder: (context, index) {
                final groupKey = groupedNotifications.keys.elementAt(index);
                final groupItems = groupedNotifications[groupKey]!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 0, 8),
                      child: Text(
                        groupKey,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ...groupItems.map((notify) {
                      final notifyIndex = notifications.indexOf(notify);
                      return _buildNotificationTile(
                          context, ref, notify, notifyIndex);
                    }),
                  ],
                );
              },
            ),
    );
  }

  Widget _buildNotificationTile(
      BuildContext context, WidgetRef ref, NotificationModel notif, int index) {
    IconData iconData;
    Color iconColor;
    String title;
    String subtitle;

    switch (notif.type) {
      case 'low_stock':
        iconData = Iconsax.warning_2;
        iconColor = Colors.orange;
        title = "Low Stock Alert";
        subtitle = "${notif.itemName} is low on stock (${notif.quantity})";
        break;
      case 'out_of_stock':
        iconData = Iconsax.close_circle;
        iconColor = Colors.red;
        title = "Out of Stock Alert";
        subtitle = "${notif.itemName} is out of stock.";
        break;
      case 'sell_checkout':
        iconData = Iconsax.shopping_cart5;
        iconColor = Colors.green;
        title = "Sell Checkout Successful";
        subtitle =
            "${notif.message} Total: \$${notif.amount?.toStringAsFixed(2)}";
        break;
      case 'buy_checkout':
        iconData = Iconsax.shopping_bag5;
        iconColor = Colors.blue;
        title = "Buy Checkout Successful";
        subtitle =
            "${notif.message} Total: \$${notif.amount?.toStringAsFixed(2)}";
        break;
      case 'return_checkout':
        iconData = Iconsax.back_square;
        iconColor = Colors.purple;
        title = "Return Checkout Successful";
        subtitle =
            "${notif.message} Amount: \$${notif.amount?.toStringAsFixed(2)}";
        break;
      default:
        iconData = Iconsax.notification5;
        iconColor = Colors.grey;
        title = "Notification";
        subtitle = notif.message ?? '';
    }

    final notifBox = ref.read(notificationBoxProvider);
    final allKeys = notifBox.keys.cast<int>().toList().reversed.toList();
    final key = allKeys[index];

    return Dismissible(
      key: Key('notification-${notif.hashCode}'),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red.withValues(alpha: 0.8),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) async {
        await ref.read(notificationBoxProvider).delete(key);
      },
      child: ListTile(
        leading: Icon(iconData, color: iconColor),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: IconButton(
          icon: Icon(
              notif.isRead ? Icons.mark_email_read : Icons.mark_email_unread),
          tooltip: notif.isRead ? 'Mark as unread' : 'Mark as read',
          onPressed: () async {
            final updatedNotify = notif.copyWith(isRead: !notif.isRead);
            await ref
                .read(notificationsProvider.notifier)
                .updateNotification(key, updatedNotify);
          },
        ),
        tileColor: notif.isRead ? null : Colors.yellow.withValues(alpha: 0.15),
        isThreeLine: true,
      ),
    );
  }
}
