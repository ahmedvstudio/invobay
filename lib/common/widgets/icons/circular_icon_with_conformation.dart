import 'package:flutter/material.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';
import '../dialogs/delete_confirm_dialog.dart';

class VCircularIconWithConfirmation extends StatelessWidget {
  const VCircularIconWithConfirmation({
    super.key,
    this.width,
    this.height,
    this.size = VSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    required this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : isDark
                ? VColors.black.withValues(alpha: 0.9)
                : VColors.white.withValues(alpha: 0.9),
      ),
      child: IconButton(
        onPressed: () => _showDeleteConfirmationDialog(context),
        icon: Icon(icon, color: color, size: size),
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => const VDeleteConfirmDialog(
        isCustomer: false,
        isGeneral: true,
        contentText: 'Are you sure you want to delete this item?',
      ),
    );
    if (confirm == true) {
      onPressed();
    }
  }
}
