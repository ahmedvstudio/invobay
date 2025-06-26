import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_ce/hive.dart';
import 'package:invobay/generated/l10n.dart';
import '../../../models/notifications/notification_model.dart';
import '../../../utils/constants/hive_box_strings.dart';
import '../notification_initializer.dart';

Future<void> showLowStockNotification(
    String itemName, int quantity, int itemId, S loc) async {
  const androidDetails = AndroidNotificationDetails(
    'low_stock_channel',
    'Low Stock Notification',
    channelDescription: 'Low stock alert',
    importance: Importance.max,
    priority: Priority.high,
  );
  const details = NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.show(
    1000 + itemId,
    loc.lowStockAlert,
    loc.lowStockItemWithQuantity(itemName, quantity),
    details,
    payload: 'low_stock',
  );

  Hive.box(VHive.notificationBox).add(NotificationModel(
    type: 'low_stock',
    itemName: itemName,
    quantity: quantity,
    timestamp: DateTime.now(),
    isRead: false,
  ).toMap());
}

Future<void> showOutOfStockNotification(
    String itemName, int itemId, S loc) async {
  const androidDetails = AndroidNotificationDetails(
    'out_of_stock_channel',
    'Out of Stock Notification',
    channelDescription: 'Out of stock alert',
    importance: Importance.max,
    priority: Priority.high,
  );
  const details = NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.show(
    2000 + itemId,
    loc.outOfStockAlert,
    loc.outOfStockItemWithName(itemName),
    details,
    payload: 'out_of_stock',
  );

  Hive.box(VHive.notificationBox).add(NotificationModel(
    type: 'out_of_stock',
    itemName: itemName,
    timestamp: DateTime.now(),
    isRead: false,
  ).toMap());
}
