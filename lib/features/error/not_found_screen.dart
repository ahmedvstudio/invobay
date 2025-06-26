import 'package:flutter/material.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.pageNotFound),
      ),
      body: Center(
        child: Text('404 - ${context.loc.pageNotFound}'),
      ),
    );
  }
}
