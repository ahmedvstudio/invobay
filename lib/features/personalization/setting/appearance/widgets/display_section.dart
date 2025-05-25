import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/sheet/settings/app_language_sheet.dart';
import '../../../../../core/utils/constants/sizes.dart';

class VDisplaySection extends ConsumerWidget {
  const VDisplaySection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Display:'),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        ListTile(
          onTap: () => showLanguageSelectionBottomSheet(context, ref),
          title: const Text('App Language.'),
          leading: const Icon(Iconsax.global),
          tileColor: Colors.transparent,
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
      ],
    );
  }
}
