import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/custom_shapes/dismissible/delete_background.dart';
import '../../../core/models/notifications/notification_model.dart';
import '../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../core/providers/notification_providers/notification_provider.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

class NotificationTile extends ConsumerWidget {
  final NotificationModel notify;
  final int index;

  const NotificationTile({
    super.key,
    required this.notify,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    IconData iconData;
    Color iconColor;
    String title;
    String subtitle;
    final currencySign = ref.watch(currencySignProvider);

    switch (notify.type) {
      case 'low_stock':
        iconData = Iconsax.warning_2;
        iconColor = VColors.warning;
        title = "Low Stock Alert";
        subtitle = "${notify.itemName} is low on stock (${notify.quantity})";
        break;
      case 'out_of_stock':
        iconData = Iconsax.close_circle;
        iconColor = Colors.red;
        title = "Out of Stock Alert";
        subtitle = "${notify.itemName} is out of stock.";
        break;
      case 'sell_checkout':
        iconData = Iconsax.shopping_cart5;
        iconColor = Colors.green;
        title = "Sell Checkout Successful";
        subtitle =
            "${notify.message} Total: $currencySign${notify.amount?.toStringAsFixed(2)}";
        break;
      case 'buy_checkout':
        iconData = Iconsax.shopping_bag5;
        iconColor = Colors.blue;
        title = "Buy Checkout Successful";
        subtitle =
            "${notify.message} Total: $currencySign${notify.amount?.toStringAsFixed(2)}";
        break;
      case 'return_checkout':
        iconData = Iconsax.back_square;
        iconColor = Colors.purple;
        title = "Return Checkout Successful";
        subtitle =
            "${notify.message} Amount: $currencySign${notify.amount?.toStringAsFixed(2)}";
        break;
      default:
        iconData = Iconsax.notification5;
        iconColor = Colors.grey;
        title = "Notification";
        subtitle = notify.message ?? '';
    }

    final notifyBox = ref.read(notificationBoxProvider);
    final allKeys = notifyBox.keys.cast<int>().toList().reversed.toList();
    final key = allKeys[index];

    return Padding(
      padding: const EdgeInsets.only(bottom: VSizes.spaceBtwItems / 2),
      child: Dismissible(
        key: Key('notification-${notify.hashCode}'),
        direction: DismissDirection.endToStart,
        background: dismissDeleteBackground(),
        onDismissed: (direction) async {
          await ref.read(notificationBoxProvider).delete(key);
        },
        child: ListTile(
          leading: Icon(iconData, color: iconColor),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: IconButton(
            icon: Icon(notify.isRead
                ? Iconsax.notification_bing
                : Iconsax.notification_bing5),
            onPressed: () async {
              final updatedNotify = notify.copyWith(isRead: !notify.isRead);
              await ref
                  .read(notificationsProvider.notifier)
                  .updateNotification(key, updatedNotify);
            },
          ),
          tileColor:
              notify.isRead ? null : VColors.warning.withValues(alpha: 0.1),
        ),
      ),
    );
  }
}
