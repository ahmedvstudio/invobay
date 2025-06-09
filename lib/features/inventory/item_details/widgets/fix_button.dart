import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../core/utils/constants/colors.dart';
import 'meta_data_section.dart';

class VFixButton extends StatelessWidget {
  const VFixButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return VMetaDataSection(
      onTap: onTap,
      tag: context.loc.fix,
      tagBackgroundColor: VColors.error,
      tagTextColor: VColors.white,
      showChild: false,
      showIcon: true,
      icon: Iconsax.danger,
      child: const Text(''),
    );
  }
}
