import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';

import '../../models/notifications/notification_model.dart';
import '../../utils/constants/hive_box_strings.dart';
import 'notification_notifier.dart';
import 'notification_toggle_notifier.dart';

final notificationBoxProvider = Provider<Box>((ref) {
  return Hive.box(VHive.notificationBox);
});

//
final notificationTogglesBoxProvider = Provider<Box>((ref) {
  return Hive.box(VHive.notificationToggleBox);
});

//
final notificationToggleProvider =
    StateNotifierProvider<NotificationToggleNotifier, Map<String, bool>>((ref) {
  final box = ref.watch(notificationTogglesBoxProvider);
  return NotificationToggleNotifier(box);
});

//
final notificationsProvider =
    StateNotifierProvider<NotificationNotifier, List<NotificationModel>>((ref) {
  final box = ref.watch(notificationBoxProvider);
  return NotificationNotifier(box);
});
