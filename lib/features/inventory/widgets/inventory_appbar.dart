import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/appbar/appbar_icon.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/text_strings.dart';

class VInventoryAppBar extends StatelessWidget {
  const VInventoryAppBar({
    super.key,
    this.onPressed,
  });
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return VAppBar(
      title: Text(VText.inventoryAppBarSubTitle,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: VColors.white)),
      actions: [
        VAppBarIcon(
          badge: false,
          icon: CupertinoIcons.plus,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
