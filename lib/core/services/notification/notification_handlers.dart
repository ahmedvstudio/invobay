import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:invobay/core/utils/messages/logger.dart';

void onNotificationTap(NotificationResponse response) {
  Vlogger.info("Notification Clicked: ${response.payload}");
}
