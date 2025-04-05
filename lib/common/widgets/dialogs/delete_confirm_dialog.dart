import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/constants/colors.dart';

class VDeleteConfirmDialog extends StatelessWidget {
  const VDeleteConfirmDialog({
    super.key,
    this.isCustomer = true,
    this.isGeneral = false,
    this.contentText,
  });

  final bool isCustomer;
  final bool isGeneral;
  final String? contentText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Deletion'),
      content: Text(isGeneral
          ? contentText ?? 'Are you sure you want to delete this?'
          : isCustomer
              ? 'Are you sure you want to delete this customer?'
              : 'Are you sure you want to delete this supplier?'),
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => context.pop(true),
          style: ElevatedButton.styleFrom(
            backgroundColor: VColors.error,
            side: const BorderSide(color: Colors.transparent),
          ),
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
