import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';

import '../../models/notifications/notification_model.dart';
import 'notification_notifier.dart';

final notificationBoxProvider = Provider<Box>((ref) {
  return Hive.box('notifications');
});

final notificationsProvider =
    StateNotifierProvider<NotificationNotifier, List<NotificationModel>>((ref) {
  final box = ref.watch(notificationBoxProvider);
  return NotificationNotifier(box);
});
