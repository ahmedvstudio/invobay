import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/router/app_router.dart';
import 'package:invobay/theme/theme.dart';

import 'core/providers/common_providers/theme_provider.dart';

class InvoBay extends ConsumerWidget {
  const InvoBay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'InvoBay',
      routerConfig: invoRouter,
      themeMode: themeMode,
      theme: VAppTheme.lightTheme,
      darkTheme: VAppTheme.darkTheme,
    );
  }
}
