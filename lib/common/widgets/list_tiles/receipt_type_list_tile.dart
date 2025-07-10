import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/providers/theme_providers/theme_related_providers.dart';

class ReceiptTypeListTile extends ConsumerWidget {
  const ReceiptTypeListTile({
    this.onTap,
    required this.receiptType,
    required this.icon,
    super.key,
  });

  final String receiptType;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = ref.watch(primaryColorProvider);

    return ListTile(
      contentPadding: VSpacingStyle.halfHorizontal,
      tileColor: primaryColor.withValues(alpha: 0.2),
      onTap: onTap,
      title: Text(
        receiptType,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      leading: Icon(icon),
    );
  }
}
