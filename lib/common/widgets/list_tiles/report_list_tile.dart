import 'package:flutter/material.dart';

import '../../../core/utils/constants/colors.dart';

class VReportListTile extends StatelessWidget {
  const VReportListTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.leadingIconColor = VColors.info,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final Color leadingIconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.transparent,
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: leadingIconColor),
      title: Text(title),
      trailing: const Icon(Icons.arrow_right),
      onTap: onTap,
    );
  }
}
