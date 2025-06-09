import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/enums.dart';

class SortFilterDialog extends StatelessWidget {
  final SortCategory selectedSortCategory;
  final SortOrder selectedSortOrder;
  final Function(SortCategory) onSortSelected;
  final VoidCallback onClearFilters;

  const SortFilterDialog({
    super.key,
    required this.selectedSortCategory,
    required this.selectedSortOrder,
    required this.onSortSelected,
    required this.onClearFilters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(VSizes.defaultSpace),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSortOption(context, context.loc.name, SortCategory.name),
          const SizedBox(height: VSizes.spaceBtwItems),

          _buildSortOption(context, context.loc.stock, SortCategory.stock),
          const SizedBox(height: VSizes.spaceBtwItems),
          _buildSortOption(context, context.loc.price, SortCategory.price),
          const SizedBox(height: VSizes.spaceBtwItems),
          // Clear Filter Button
          TextButton.icon(
            onPressed: () {
              onClearFilters();
              context.pop();
            },
            icon: const Icon(Icons.clear, color: VColors.error),
            label: Text(context.loc.clearFilters),
            style: TextButton.styleFrom(
              foregroundColor: VColors.error,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSortOption(
      BuildContext context, String title, SortCategory category) {
    bool isSelected = selectedSortCategory == category;
    bool isAscending = selectedSortOrder == SortOrder.ascending;
    final isDark = VHelperFunctions.isDarkMode(context);

    return VRoundedContainer(
      backgroundColor: isSelected
          ? isDark
              ? VColors.kPrimary
              : VColors.kSecondary
          : isDark
              ? VColors.dark
              : VColors.light,
      child: ListTile(
        title: Text(title),
        trailing: Icon(
          isSelected
              ? (isAscending
                  ? CupertinoIcons.arrow_up
                  : CupertinoIcons.arrow_down)
              : Icons.swap_vert,
        ),
        onTap: () {
          onSortSelected(category);
          context.pop();
        },
      ),
    );
  }
}
