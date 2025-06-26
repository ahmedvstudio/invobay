import 'package:go_router/go_router.dart';

import '../../../common/widgets/success_screen/success_screen.dart';
import '../router_constant.dart';

List<GoRoute> successFailRoute = [
  GoRoute(
    name: VRouter.sellReceiptsSuccess,
    path: '/sellReceiptsSuccess',
    builder: (context, state) => const SuccessScreen(),
  ),
  GoRoute(
    name: VRouter.buyReceiptsSuccess,
    path: '/buyReceiptsSuccess',
    builder: (context, state) => const SuccessScreen(),
  ),
  GoRoute(
    name: VRouter.returnsReceiptsSuccess,
    path: '/returnsReceiptsSuccess',
    builder: (context, state) => const SuccessScreen(),
  ),
];
