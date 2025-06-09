import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import 'package:invobay/common/widgets/sheet/settings/app_language_sheet.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

class VDisplaySection extends ConsumerWidget {
  const VDisplaySection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${context.loc.display}:'),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        ListTile(
          onTap: () => showLanguageSelectionBottomSheet(context, ref),
          title: Text(context.loc.appLanguage),
          leading: const Icon(Iconsax.global),
          tileColor: Colors.transparent,
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
      ],
    );
  }
}
