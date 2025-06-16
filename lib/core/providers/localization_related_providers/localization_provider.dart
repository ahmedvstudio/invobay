import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../generated/l10n.dart';
import '../../router/app_router.dart';

final localizationProvider = Provider<S>((ref) {
  final context = ref.watch(navigatorKeyProvider).currentContext;
  return context != null ? S.of(context) : S.current;
});

//
final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return navigatorKey;
});
