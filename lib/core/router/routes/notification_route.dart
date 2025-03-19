import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/features/notification/notification_screen.dart';

List<GoRoute> notificationRoutes = [
  GoRoute(
    name: VRouter.notification,
    path: '/notification',
    builder: (context, state) => const NotificationScreen(),
  ),
];
