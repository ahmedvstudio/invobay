import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';

import '../../../features/returns/returns_screen.dart';

List<GoRoute> returnsRoutes = [
  GoRoute(
    name: VRouter.returns,
    path: '/returns',
    builder: (context, state) => const ReturnsScreen(),
  ),
];
