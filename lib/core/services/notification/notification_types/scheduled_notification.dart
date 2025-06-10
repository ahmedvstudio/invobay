import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import '../notification_initializer.dart';

Future<void> scheduledNotification(DateTime dateTime) async {
  const androidDetails = AndroidNotificationDetails(
    'scheduled_channel',
    'Scheduled Notification',
    channelDescription: 'Channel for Scheduled Notification',
    importance: Importance.max,
    priority: Priority.high,
  );
  const notificationDetails = NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.zonedSchedule(
    1,
    'Notification Title',
    'Notification Body',
    tz.TZDateTime.from(dateTime, tz.local),
    notificationDetails,
    payload: 'scheduled',
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  );
}
