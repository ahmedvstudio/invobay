import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invobay/screens/getting_started/getting_started.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/utils/theme/theme.dart';

void main() {
  runApp(const ProviderScope(child: InvoBay()));
}

class InvoBay extends StatelessWidget {
  const InvoBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'InvoBay',
      themeMode: ThemeMode.system,
      theme: VAppTheme.lightTheme,
      darkTheme: VAppTheme.darkTheme,
      home: const GettingStarted(),
    );
  }
}
