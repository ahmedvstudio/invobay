import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/router/router_constant.dart';

import '../../../../../core/utils/constants/sizes.dart';

class VDisplaySection extends StatelessWidget {
  const VDisplaySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Display:'),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        ListTile(
          onTap: () => context.pushNamed(VRouter.appLanguage),
          title: const Text('App Language.'),
          leading: const Icon(Iconsax.global),
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
      ],
    );
  }
}
