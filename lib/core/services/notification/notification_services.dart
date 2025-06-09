import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_ce/hive.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:invobay/core/utils/messages/logger.dart';
import 'package:invobay/core/utils/permissions/permissions.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../models/notifications/notification_model.dart';

class NotificationServices {
  //
  static final NotificationServices _instance =
      NotificationServices._internal();
  factory NotificationServices() => _instance;
  NotificationServices._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// --> init Notification
  Future<void> initialize() async {
    // Android
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    // IOS
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    /// --> initializationSettings
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );

    await VPermissions.requestNotificationPermission();
  }

  /// --> Notification Clicked
  void _onNotificationTap(NotificationResponse respond) {
    Vlogger.info("Notification Clicked ${respond.payload}");
  }

  /// --> Instant Notification
  Future<void> showInstantNotification() async {
    // --> Android
    const AndroidNotificationDetails androidPlatformChannelSpecifies =
        AndroidNotificationDetails(
      'instant_channel',
      'Instant Notification',
      channelDescription: 'Channel for Instant Notification',
      importance: Importance.max,
      priority: Priority.high,
    );
    // --> Platform
    const NotificationDetails platformChannelSpecifies =
        NotificationDetails(android: androidPlatformChannelSpecifies);

    // --> Notification
    await flutterLocalNotificationsPlugin.show(
      0,
      'Notification Title',
      'Notification Body',
      platformChannelSpecifies,
      payload: 'instant',
    );
  }

  /// --> Scheduled Notification
  Future<void> scheduledNotification(DateTime scheduledDateTime) async {
    // --> Android
    const AndroidNotificationDetails androidPlatformChannelSpecifies =
        AndroidNotificationDetails(
      'scheduled_channel',
      'Scheduled Notification',
      channelDescription: 'Channel for Scheduled Notification',
      importance: Importance.max,
      priority: Priority.high,
    );
    // --> Platform
    const NotificationDetails platformChannelSpecifies =
        NotificationDetails(android: androidPlatformChannelSpecifies);

    // --> Notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
      1,
      'Notification Title',
      'Notification Body',
      tz.TZDateTime.from(scheduledDateTime, tz.local),
      platformChannelSpecifies,
      payload: 'scheduled',
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  /// ----------------------- testing
  Future<void> showLowStockNotification(
      String itemName, int quantity, int itemId) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'low_stock_channel',
      'Low Stock Notification',
      channelDescription: 'Channel for Low Stock Notification',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      1000 + itemId,
      'Low Stock Alert',
      '$itemName is low on stock ($quantity left).',
      platformDetails,
      payload: 'low_stock',
    );

    // Store in Hive for the notification screen
    final notifyBox = Hive.box('notifications');
    notifyBox.add(NotificationModel(
      type: 'low_stock',
      itemName: itemName,
      quantity: quantity,
      timestamp: DateTime.now(),
      isRead: false,
    ).toMap());
  }

  Future<void> showOutOfStockNotification(String itemName, int itemId) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'out_of_stock_channel',
      'Out of Stock Notification',
      channelDescription: 'Channel for Out of Stock Notification',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      2000 + itemId,
      'Out of Stock Alert',
      '$itemName is out of stock!',
      platformDetails,
      payload: 'out_of_stock',
    );
    final notifyBox = Hive.box('notifications');
    notifyBox.add(NotificationModel(
      type: 'out_of_stock',
      itemName: itemName,
      timestamp: DateTime.now(),
      isRead: false,
    ).toMap());
  }

  ///
  Future<void> showSellCheckoutNotification(double totalPrice) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'checkout_channel',
      'Checkout Notifications',
      channelDescription: 'Notifications for successful checkouts',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      3000,
      'Sell Checkout Successful',
      'Selling completed successfully. Total: ${VFormatters.formatPrice(totalPrice)}',
      platformDetails,
      payload: 'sell_checkout',
    );
    final notifyBox = Hive.box('notifications');
    notifyBox.add(NotificationModel(
      type: 'sell_checkout',
      message: 'Selling completed successfully.',
      amount: totalPrice,
      timestamp: DateTime.now(),
      isRead: false,
    ).toMap());
  }

  Future<void> showBuyCheckoutNotification(double totalPrice) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'checkout_channel',
      'Checkout Notifications',
      channelDescription: 'Notifications for successful checkouts',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      3001,
      'Buy Checkout Successful',
      'Buying completed successfully. Total: ${VFormatters.formatPrice(totalPrice)}',
      platformDetails,
      payload: 'buy_checkout',
    );
    final notifyBox = Hive.box('notifications');
    notifyBox.add(NotificationModel(
      type: 'buy_checkout',
      message: 'Buying completed successfully.',
      amount: totalPrice,
      timestamp: DateTime.now(),
      isRead: false,
    ).toMap());
  }

  Future<void> showReturnCheckoutNotification(double totalPrice) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'checkout_channel',
      'Checkout Notifications',
      channelDescription: 'Notifications for successful checkouts',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      3002,
      'Return Checkout Successful',
      'Return completed successfully. Amount: ${VFormatters.formatPrice(totalPrice)}',
      platformDetails,
      payload: 'return_checkout',
    );
    final notifyBox = Hive.box('notifications');
    notifyBox.add(NotificationModel(
      type: 'return_checkout',
      message: 'Return completed successfully.',
      amount: totalPrice,
      timestamp: DateTime.now(),
      isRead: false,
    ).toMap());
  }
}
