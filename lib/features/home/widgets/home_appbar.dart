import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/providers/db_providers/hive_providers/app_settings_provider.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/appbar/appbar_icon.dart';
import '../../../core/providers/common_providers/default_providers.dart';
import '../../../core/providers/notification_providers/notification_related_provider.dart';
import '../../../core/utils/constants/colors.dart';

class VHomeAppBar extends ConsumerWidget {
  const VHomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowAsync = ref.watch(liveTimeProvider);
    final notifications = ref.watch(notificationsProvider);
    final locale = ref.watch(localeProvider);
    final isLTR = VHelperFunctions.isEnglish(locale);
    return VAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.loc.welcomeBack,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: VColors.grey),
          ),
          nowAsync.when(
            data: (now) => Text(
              VFormatters.formatHomeTime(now),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: VColors.white),
            ),
            loading: () => const CircularProgressIndicator(),
            error: (e, _) => const Text('--'),
          ),
          nowAsync.when(
            data: (now) => Text(
              VFormatters.formatHomeDate(now),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: VColors.white),
            ),
            loading: () => const CircularProgressIndicator(),
            error: (e, _) => const Text('--'),
          ),
        ],
      ),
      actions: [
        VAppBarIcon(
          onPressed: () => context.pushNamed(VRouter.notification),
          icon: notifications.where((n) => !n.isRead).isEmpty
              ? Iconsax.notification
              : Iconsax.notification5,
          badgeText: '${notifications.where((n) => !n.isRead).length}',
          isLTR: isLTR,
        ),
      ],
    );
  }
}
