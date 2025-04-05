import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appbar.dart';
import 'appbar_icon.dart';
import '../../../core/utils/constants/colors.dart';

class VMainAppBar extends StatelessWidget {
  const VMainAppBar({
    super.key,
    this.onPressed,
    required this.title,
    this.appbarIcon = CupertinoIcons.plus,
    this.showAppbarIcon = true,
    this.textColor = VColors.white,
  });
  final VoidCallback? onPressed;
  final String title;
  final bool showAppbarIcon;
  final IconData appbarIcon;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return VAppBar(
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: textColor)),
      actions: [
        VAppBarIcon(
          badge: false,
          icon: appbarIcon,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
