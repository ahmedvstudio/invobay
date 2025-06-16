import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_ce/hive.dart';
import '../../../models/notifications/notification_model.dart';
import '../../../utils/constants/hive_box_strings.dart';
import '../notification_initializer.dart';

Future<void> showLowStockNotification(
    String itemName, int quantity, int itemId) async {
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
    'Low Stock Alert',
    '$itemName is low on stock ($quantity left).',
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

Future<void> showOutOfStockNotification(String itemName, int itemId) async {
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
    'Out of Stock Alert',
    '$itemName is out of stock!',
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
