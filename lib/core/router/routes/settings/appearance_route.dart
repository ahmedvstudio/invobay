import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/personalization/setting/app_settings/appearance/appearance_screen.dart';
import '../../router_constant.dart';

List<GoRoute> appearanceRoute = [
  GoRoute(
    name: VRouter.appearance,
    path: '/appearance',
    pageBuilder: (context, state) =>
        const MaterialPage(child: AppearanceScreen()),
  ),
];
