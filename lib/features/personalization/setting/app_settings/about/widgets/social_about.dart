import 'package:flutter/material.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:simple_icons/simple_icons.dart';

class VSocialAbout extends StatelessWidget {
  const VSocialAbout({
    super.key,
    required this.iconColor,
  });
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    const iconSize = VSizes.iconLg;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: null,
          icon: Icon(
            SimpleIcons.facebook,
            color: iconColor,
            size: iconSize,
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            SimpleIcons.x,
            size: iconSize,
            color: iconColor,
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            SimpleIcons.reddit,
            color: iconColor,
            size: iconSize,
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            SimpleIcons.github,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ],
    );
  }
}
