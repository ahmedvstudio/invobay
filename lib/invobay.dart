import 'package:flutter/material.dart';
import 'package:invobay/core/router/app_router.dart';
import 'theme/theme.dart';

class InvoBay extends StatelessWidget {
  const InvoBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'InvoBay',
      routerConfig: invoRouter,
      themeMode: ThemeMode.system,
      theme: VAppTheme.lightTheme,
      darkTheme: VAppTheme.darkTheme,
    );
  }
}
