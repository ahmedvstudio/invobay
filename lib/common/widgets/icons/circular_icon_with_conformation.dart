import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';

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

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                onPressed();
                context.pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
