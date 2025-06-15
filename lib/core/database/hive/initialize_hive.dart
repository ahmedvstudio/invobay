import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:invobay/core/database/hive/hive_registrar.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapters();

  await Hive.openBox('stock_notification_flags');
  await Hive.openBox('notifications');
  await Hive.openBox('notification_toggles');
  await Hive.openBox('theme_color');
  await Hive.openBox('encryption');
}
