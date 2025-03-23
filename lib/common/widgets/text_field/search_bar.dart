import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';

class VSearchBar extends StatelessWidget {
  const VSearchBar({
    super.key,
    this.searchController,
    this.suffixIcon,
    this.onChanged,
  });

  final TextEditingController? searchController;
  final Widget? suffixIcon;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace),
      child: TextField(
        onChanged: onChanged,
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search in stock',
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
