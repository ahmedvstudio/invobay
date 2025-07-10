import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:invobay/core/providers/localization_related_providers/localization_provider.dart';
import '../../../models/notifications/notification_model.dart';
import '../../../providers/notification_providers/notification_related_provider.dart';
import '../../../utils/constants/hive_box_strings.dart';
import '../../../utils/formatters/formatters.dart';
import '../notification_initializer.dart';

Future<void> showSellCheckoutNotification(
    double totalPrice, WidgetRef ref) async {
  final loc = ref.watch(localizationProvider);
  final toggles = ref.read(notificationToggleProvider);
  if (toggles['sell_checkout'] == true) {
    await _showCheckoutNotification(
      id: 3000,
      title: loc.sellCheckoutSuccessful,
      body: loc
          .completedSuccessfullyWithTotal(VFormatters.formatPrice(totalPrice)),
      type: 'sell_checkout',
      amount: totalPrice,
      message: loc.sellCheckoutSuccessful,
    );
  }
}

Future<void> showBuyCheckoutNotification(
    double totalPrice, WidgetRef ref) async {
  final loc = ref.watch(localizationProvider);
  final toggles = ref.read(notificationToggleProvider);
  if (toggles['buy_checkout'] == true) {
    await _showCheckoutNotification(
      id: 3001,
      title: loc.buyCheckoutSuccessful,
      body: loc
          .completedSuccessfullyWithTotal(VFormatters.formatPrice(totalPrice)),
      type: 'buy_checkout',
      amount: totalPrice,
      message: loc.buyCheckoutSuccessful,
    );
  }
}

Future<void> showReturnCheckoutNotification(
    double totalPrice, WidgetRef ref) async {
  final loc = ref.watch(localizationProvider);
  final toggles = ref.read(notificationToggleProvider);
  if (toggles['return_checkout'] == true) {
    await _showCheckoutNotification(
      id: 3002,
      title: loc.returnCheckoutSuccessful,
      body: loc
          .completedSuccessfullyWithTotal(VFormatters.formatPrice(totalPrice)),
      type: 'return_checkout',
      amount: totalPrice,
      message: loc.returnCheckoutSuccessful,
    );
  }
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

  Hive.box(VHive.notificationBox).add(NotificationModel(
    type: type,
    message: message,
    amount: amount,
    timestamp: DateTime.now(),
    isRead: false,
  ).toMap());
}
