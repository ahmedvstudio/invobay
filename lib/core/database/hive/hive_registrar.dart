import 'package:hive_ce/hive.dart';
import 'package:invobay/core/database/hive/shop_details/shop_details.dart';
import 'package:invobay/core/database/hive/theme/app_theme.dart';

import 'app_settings/app_settings.dart';

extension HiveRegistrar on HiveInterface {
  void registerAdapters() {
    registerAdapter(AppThemeAdapter());
    registerAdapter(ShopDetailAdapter());
    registerAdapter(AppSettingsAdapter());
  }
}

extension IsolatedHiveRegistrar on IsolatedHiveInterface {
  void registerAdapters() {
    registerAdapter(AppSettingsAdapter());
    registerAdapter(AppThemeAdapter());
    registerAdapter(ShopDetailAdapter());
  }
}
