import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/database/hive/hive_registrar.dart';
import 'package:invobay/invobay.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'core/services/notification/notification_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// --> init timezone
  tz.initializeTimeZones();

  /// --> init Notification
  await NotificationServices().initialize();

  /// --> init Hive
  await Hive.initFlutter();
  Hive.registerAdapters();

  /// --> open the notification flags box and notifications box
  await Hive.openBox('stock_notification_flags');
  await Hive.openBox('notifications');

  runApp(
    const ProviderScope(
      child: InvoBay(),
    ),
  );
}
