import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:invobay/core/database/hive/hive_registrar.dart';
import 'package:invobay/core/database/hive/shop_details/shop_details.dart';
import 'package:invobay/core/database/hive/theme/app_theme.dart';

import '../../utils/constants/hive_box_strings.dart';
import 'app_settings/app_settings.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapters();

  await Hive.openBox(VHive.stockNotificationFlagBox);
  await Hive.openBox(VHive.notificationBox);
  await Hive.openBox(VHive.notificationToggleBox);
  await Hive.openBox(VHive.themeColorBox);
  await Hive.openBox(VHive.encryptionBox);
  await Hive.openBox<AppSettings>(VHive.appSettingsBox);
  await Hive.openBox<ShopDetail>(VHive.shopDetailBox);
  await Hive.openBox<AppTheme>(VHive.themeModeBox);
}
