import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/invobay.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/database/hive/initialize_hive.dart';
import 'core/services/notification/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// --> load .env
  await dotenv.load(fileName: ".env");

  /// --> init timezone
  tz.initializeTimeZones();

  /// --> init Notification
  await initializeNotifications();

  /// --> init Hive
  await initializeHive();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  runApp(
    const ProviderScope(
      child: InvoBay(),
    ),
  );
}
