import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';

import '../../../features/reports/reports_screen.dart';

List<GoRoute> reportRoutes = [
  GoRoute(
    name: VRouter.reports,
    path: '/reports',
    builder: (context, state) => const ReportsScreen(),
  ),
];
