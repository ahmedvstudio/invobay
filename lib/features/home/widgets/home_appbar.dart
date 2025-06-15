import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/appbar/appbar_icon.dart';
import '../../../core/providers/notification_providers/notification_related_provider.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/text_strings.dart';

class VHomeAppBar extends StatelessWidget {
  const VHomeAppBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return VAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.loc.welcomeBack,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: VColors.grey)),
          Text(VText.homeAppBarSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: VColors.white)),
        ],
      ),
      actions: [
        Consumer(
          builder: (context, ref, _) {
            final notifications = ref.watch(notificationsProvider);
            final unreadCount = notifications.where((n) => !n.isRead).length;
            return VAppBarIcon(
              onPressed: () => context.pushNamed(VRouter.notification),
              icon: unreadCount == 0
                  ? Iconsax.notification
                  : Iconsax.notification5,
              badgeText: '$unreadCount',
            );
          },
        ),
      ],
    );
  }
}
