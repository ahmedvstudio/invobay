import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../router/app_router.dart';

final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return navigatorKey;
});
