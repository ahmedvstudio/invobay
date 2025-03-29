import 'package:flutter/material.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../custom_shapes/containers/primary_header_container.dart';
import 'appbar.dart';

class VCustomAppBar extends StatelessWidget {
  const VCustomAppBar({
    super.key,
    required this.text,
    this.showBackArrow = true,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
  });
  final String text;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return VPrimaryHeaderContainer(
      child: Column(
        children: [
          VAppBar(
            title: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: VColors.white),
            ),
            showBackArrow: showBackArrow,
            leadingIcon: leadingIcon,
            leadingOnPressed: leadingOnPressed,
            actions: actions,
            justWhiteBackArrow: true,
          ),
          const SizedBox(height: VSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
