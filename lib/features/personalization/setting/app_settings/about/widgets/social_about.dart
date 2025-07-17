import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invobay/core/utils/constants/image_strings.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/constants/url_text.dart';
import 'package:invobay/core/utils/device/device_utility.dart';
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
          onPressed: () => VDeviceUtils.launchCustomUrl(VUrl.website),
          icon: SvgPicture.asset(
            VImages.globeSVG,
            height: iconSize + 5,
            colorFilter: ColorFilter.mode(
              iconColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        IconButton(
          onPressed: () => VDeviceUtils.launchCustomUrl(VUrl.facebook),
          icon: Icon(
            SimpleIcons.facebook,
            size: iconSize,
            color: iconColor,
          ),
        ),
        IconButton(
          onPressed: () => VDeviceUtils.launchCustomUrl(VUrl.github),
          icon: Icon(
            SimpleIcons.github,
            color: iconColor,
            size: iconSize,
          ),
        ),
        IconButton(
          onPressed: () => VDeviceUtils.launchCustomUrl(VUrl.discordInvite),
          icon: Icon(
            SimpleIcons.discord,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ],
    );
  }
}
