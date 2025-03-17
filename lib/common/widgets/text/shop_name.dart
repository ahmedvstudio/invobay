import 'package:flutter/material.dart';

import '../../../core/utils/constants/colors.dart';

class VShopName extends StatelessWidget {
  const VShopName({
    super.key,
    this.text = 'Shop Name',
    this.textColor = VColors.white,
  });
  final String text;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      'Shop Name',
      style:
          Theme.of(context).textTheme.displaySmall!.apply(color: Colors.white),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
