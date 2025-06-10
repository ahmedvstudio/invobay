import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/invobay.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'core/database/hive/initialize_hive.dart';
import 'core/services/notification/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// --> init timezone
  tz.initializeTimeZones();

  /// --> init Notification
  await initializeNotifications();

  /// --> init Hive
  await initializeHive();

  runApp(
    const ProviderScope(
      child: InvoBay(),
    ),
  );
}
