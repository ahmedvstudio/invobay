import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/personalization/setting/appearance/appearance_screen.dart';
import '../../router_constant.dart';

List<GoRoute> appearanceRoute = [
  GoRoute(
    name: VRouter.appearance,
    path: '/appearance',
    pageBuilder: (context, state) =>
        const MaterialPage(child: AppearanceScreen()),
    // routes: [
    //   GoRoute(
    //       name: VRouter.appLanguage,
    //       path: '/appLanguage',
    //       pageBuilder: (context, state) => const MaterialPage(
    //           child: AppLanguageScreen(), fullscreenDialog: true)),
    // ],
  ),
];
