import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/adapters.dart';

import '../../models/notifications/notification_model.dart';

class NotificationNotifier extends StateNotifier<List<NotificationModel>> {
  final Box _box;

  NotificationNotifier(this._box) : super([]) {
    _loadNotifications();

    // Listen to changes in the box
    _box.listenable().addListener(_loadNotifications);
  }

  void _loadNotifications() {
    final notifications = _box.values
        .cast<Map>()
        .map((e) => NotificationModel.fromMap(e))
        .toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));

    state = notifications;
  }

  Future<void> updateNotification(int key, NotificationModel updated) async {
    await _box.put(key, updated.toMap());
  }

  Future<void> clearAll() async {
    await _box.clear();
  }
}
