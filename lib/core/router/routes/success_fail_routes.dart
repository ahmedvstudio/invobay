import 'package:go_router/go_router.dart';

import '../../../common/widgets/success_screen/success_screen.dart';
import '../../utils/constants/image_strings.dart';
import '../router_constant.dart';

List<GoRoute> successFailRoute = [
  GoRoute(
    name: VRouter.sellReceiptsSuccess,
    path: '/sellReceiptsSuccess',
    builder: (context, state) => SuccessScreen(
      image: VImages.success1,
      title: 'Success',
      subTitle: 'Receipt saved successfully',
      onPressed: () => context.pop(),
    ),
  ),
  GoRoute(
    name: VRouter.buyReceiptsSuccess,
    path: '/buyReceiptsSuccess',
    builder: (context, state) => SuccessScreen(
      image: VImages.success1,
      title: 'Success',
      subTitle: 'Receipt saved successfully',
      onPressed: () => context.pop(),
    ),
  ),
  GoRoute(
    name: VRouter.returnsReceiptsSuccess,
    path: '/returnsReceiptsSuccess',
    builder: (context, state) => SuccessScreen(
      image: VImages.success1,
      title: 'Success',
      subTitle: 'Receipt saved successfully',
      onPressed: () => context.pop(),
    ),
  ),
];
