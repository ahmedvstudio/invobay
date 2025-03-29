import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/image_strings.dart';
import '../images/circular_image.dart';

class VUserProfileTile extends StatelessWidget {
  const VUserProfileTile({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const VCircularImage(
          image: VImages.darkAppLogo, width: 50, height: 50, padding: 0),
      title: Text(
        'Ahmed Adnan',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: VColors.white),
      ),
      subtitle: Text(
        'example@example.com',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: VColors.white),
      ),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.edit,
            color: VColors.white,
          )),
    );
  }
}
