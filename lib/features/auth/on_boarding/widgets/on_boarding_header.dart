import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../common/widgets/sheet/settings/app_language_sheet.dart';
import '../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/constants/lists.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/device/device_utility.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

class OnBoardingHeader extends ConsumerWidget {
  const OnBoardingHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = VHelperFunctions.isDarkMode(context);
    final currentLocale = ref.watch(localeProvider);
    final currentLanguageLabel = VLists.languages.firstWhere(
          (lang) => lang['code'] == currentLocale.languageCode,
          orElse: () => VLists.languages.first,
        )['label'] ??
        'English';

    return Stack(
      children: [
        Positioned(
          top: 30,
          right: 0,
          child: TextButton(
            onPressed: () => showLanguageSelectionBottomSheet(context, ref),
            child: Text(currentLanguageLabel),
          ),
        ),
        Column(
          children: [
            SizedBox(height: VDeviceUtils.getScreenHeight(context) * 0.1),
            Text(context.loc.welcomeTo,
                style: Theme.of(context).textTheme.headlineMedium),
            Image.asset(isDark ? VImages.lightAppBanner : VImages.darkAppBanner,
                height: VSizes.imageThumbSize),
            const SizedBox(height: VSizes.spaceBtwSections),
            Text(
              context.loc.onBoardingHeaderText,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
