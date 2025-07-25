import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/theme_providers/theme_related_providers.dart';

class VSettingsMenuTile extends StatelessWidget {
  const VSettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.subTitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String? subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Consumer(
        builder: (context, ref, _) {
          return Icon(icon, size: 28, color: ref.watch(primaryColorProvider));
        },
      ),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: subTitle != null
          ? Text(subTitle ?? '', style: Theme.of(context).textTheme.labelMedium)
          : null,
      trailing: trailing,
      onTap: onTap,
      tileColor: Colors.transparent,
    );
  }
}
