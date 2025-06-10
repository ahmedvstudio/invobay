import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../notification_initializer.dart';

Future<void> showInstantNotification() async {
  const androidDetails = AndroidNotificationDetails(
    'instant_channel',
    'Instant Notification',
    channelDescription: 'Channel for Instant Notification',
    importance: Importance.max,
    priority: Priority.high,
  );
  const notificationDetails = NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.show(
    0,
    'Notification Title',
    'Notification Body',
    notificationDetails,
    payload: 'instant',
  );
}
