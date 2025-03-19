import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';

import '../../../features/setting/setting_screen.dart';

List<GoRoute> settingRoutes = [
  GoRoute(
    name: VRouter.setting,
    path: '/setting',
    builder: (context, state) => const SettingScreen(),
  ),
];
