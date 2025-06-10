export 'notification_initializer.dart';
export 'notification_handlers.dart';
export 'notification_types/instant_notification.dart';
export 'notification_types/scheduled_notification.dart';
export 'notification_types/stock_notifications.dart';
export 'notification_types/checkout_notifications.dart';

class NotificationServices {
  static final NotificationServices _instance =
      NotificationServices._internal();
  factory NotificationServices() => _instance;
  NotificationServices._internal();
}
