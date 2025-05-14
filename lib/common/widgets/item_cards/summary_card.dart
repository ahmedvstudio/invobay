import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/providers/db_providers/hive_providers/app_settings_provider.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';

import '../../../core/utils/constants/sizes.dart';

class VSummaryCard extends ConsumerWidget {
  final String title;
  final double amount;
  final IconData icon;
  final Color color;

  const VSummaryCard({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currencySign = ref.watch(currencySignProvider);
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(VSizes.md),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: VSizes.sm),
            Text(title, style: theme.textTheme.labelMedium),
            Text(
              '$currencySign ${VFormatters.formatPrice(amount)}',
              style: theme.textTheme.titleLarge!.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
