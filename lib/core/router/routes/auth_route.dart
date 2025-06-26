import 'package:go_router/go_router.dart';

import 'package:invobay/core/router/router_constant.dart';

import '../../../features/auth/on_boarding/on_boarding_screen.dart';

List<GoRoute> authRoutes = [
  GoRoute(
    name: VRouter.onBoarding,
    path: '/onBoarding',
    builder: (context, state) => const OnBoardingScreen(),
  ),
];
