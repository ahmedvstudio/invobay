import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce/hive.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../core/providers/common_providers/default_providers.dart';
import '../../../../core/router/router_constant.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/hive_box_strings.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/constants/text_strings.dart';
import '../../../../core/utils/dialogs/dialogs.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

class OnBoardingFooter extends ConsumerWidget {
  const OnBoardingFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = VHelperFunctions.isDarkMode(context);
    final isChecked = ref.watch(onBoardingCheckboxProvider);
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: isChecked,
                onChanged: (value) {
                  if (value != null) {
                    ref.read(onBoardingCheckboxProvider.notifier).state = value;
                  }
                },
              ),
            ),
            const SizedBox(width: VSizes.spaceBtwItems),
            Flexible(
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: '${context.loc.iAgreeTo} ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                    text: context.loc.privacyPolicy,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: isDark ? VColors.white : VColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              isDark ? VColors.white : VColors.primary,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => VDialogs.ok(
                          context,
                          context.loc.privacyPolicy,
                          VText.privacyPolicyMessage),
                  ),
                  TextSpan(
                      text: ' ${context.loc.and} ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                    text: context.loc.termsOfUse,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: isDark ? VColors.white : VColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              isDark ? VColors.white : VColors.primary,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => VDialogs.ok(context,
                          context.loc.termsOfUse, VText.termsOfUseMessage),
                  ),
                ]),
              ),
            ),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwSections * 1.5),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isChecked
                ? () async {
                    final box = Hive.box(VHive.settingsBox);
                    await box.put(VHive.onBoardingCompletedKey, true);
                    if (context.mounted) {
                      context.goNamed(VRouter.home);
                    }
                  }
                : null,
            child: Text(context.loc.continue1),
          ),
        ),
      ],
    );
  }
}
