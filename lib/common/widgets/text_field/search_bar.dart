import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';

class VSearchBar extends StatelessWidget {
  const VSearchBar({
    super.key,
    this.searchController,
    this.suffixIcon,
    this.onChanged,
    this.focusNode,
  });

  final TextEditingController? searchController;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace),
      child: TextField(
        onChanged: onChanged,
        controller: searchController,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: context.loc.searchInStock,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(VSizes.cardRadiusLg),
          ),
          suffixIcon: suffixIcon,
          prefixIcon:
              const Icon(Iconsax.search_normal, color: VColors.darkerGrey),
          filled: true,
          fillColor: isDark ? VColors.dark : VColors.light,
        ),
      ),
    );
  }
}
