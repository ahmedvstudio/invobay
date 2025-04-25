import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/router/app_router.dart';
import 'package:invobay/generated/l10n.dart';
import 'package:invobay/theme/theme.dart';

import 'core/providers/localization_related_providers/local_provider.dart';
import 'core/providers/common_providers/theme_provider.dart';

class InvoBay extends ConsumerWidget {
  const InvoBay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localProvider);

    return MaterialApp.router(
      locale: locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'InvoBay',
      routerConfig: invoRouter,
      themeMode: themeMode,
      theme: VAppTheme.lightTheme,
      darkTheme: VAppTheme.darkTheme,
    );
  }
}
