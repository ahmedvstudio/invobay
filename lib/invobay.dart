import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/router/app_router.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import 'package:invobay/generated/l10n.dart';
import 'package:invobay/theme/theme.dart';

import 'core/providers/db_providers/hive_providers/app_settings_provider.dart';
import 'core/providers/theme_providers/theme_related_providers.dart';

class InvoBay extends ConsumerWidget {
  const InvoBay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localeProvider);
    final fontFamily = VHelperFunctions.getFontFamilyForLocale(locale);
    final lightTheme = VAppTheme.lightTheme(fontFamily: fontFamily, ref: ref);
    final darkTheme = VAppTheme.darkTheme(fontFamily: fontFamily, ref: ref);

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
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
