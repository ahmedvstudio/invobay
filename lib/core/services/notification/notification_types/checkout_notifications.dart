import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_ce/hive.dart';
import '../../../models/notifications/notification_model.dart';
import '../../../utils/formatters/formatters.dart';
import '../notification_initializer.dart';

Future<void> showSellCheckoutNotification(double totalPrice) async {
  await _showCheckoutNotification(
    id: 3000,
    title: 'Sell Checkout Successful',
    body:
        'Selling completed successfully. Total: ${VFormatters.formatPrice(totalPrice)}',
    type: 'sell_checkout',
    amount: totalPrice,
    message: 'Selling completed successfully.',
  );
}

Future<void> showBuyCheckoutNotification(double totalPrice) async {
  await _showCheckoutNotification(
    id: 3001,
    title: 'Buy Checkout Successful',
    body:
        'Buying completed successfully. Total: ${VFormatters.formatPrice(totalPrice)}',
    type: 'buy_checkout',
    amount: totalPrice,
    message: 'Buying completed successfully.',
  );
}

Future<void> showReturnCheckoutNotification(double totalPrice) async {
  await _showCheckoutNotification(
    id: 3002,
    title: 'Return Checkout Successful',
    body:
        'Return completed successfully. Amount: ${VFormatters.formatPrice(totalPrice)}',
    type: 'return_checkout',
    amount: totalPrice,
    message: 'Return completed successfully.',
  );
}

Future<void> _showCheckoutNotification({
  required int id,
  required String title,
  required String body,
  required String type,
  required double amount,
  required String message,
}) async {
  const androidDetails = AndroidNotificationDetails(
    'checkout_channel',
    'Checkout Notifications',
    channelDescription: 'Notifications for successful checkouts',
    importance: Importance.max,
    priority: Priority.high,
  );
  const details = NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.show(id, title, body, details,
      payload: type);

  Hive.box('notifications').add(NotificationModel(
    type: type,
    message: message,
    amount: amount,
    timestamp: DateTime.now(),
    isRead: false,
  ).toMap());
}
